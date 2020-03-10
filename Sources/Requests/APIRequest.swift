//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import BitriseAPIModels
import BitriseAPISharedCode

public class APIRequest<ResponseType: APIResponseValue> {

    public let service: APIService<ResponseType>
    public private(set) var queryParameters: [String: Any]
    public private(set) var formParameters: [String: Any]
    public let encodeBody: ((RequestEncoder) throws -> Data)?
    private(set) var headerParameters: [String: String]
    public var customHeaders: [String: String] = [:]

    public var headers: [String: String] {
        return headerParameters.merging(customHeaders) { param, custom in return custom }
    }

    public var path: String {
        return service.path
    }

    public init(service: APIService<ResponseType>, 
                queryParameters: [String: Any] = [:], 
                formParameters: [String: Any] = [:],
                headers: [String: String] = [:], 
                encodeBody: ((RequestEncoder) throws -> Data)? = nil) {
        self.service = service
        self.queryParameters = queryParameters
        self.formParameters = formParameters
        self.headerParameters = headers
        self.encodeBody = encodeBody
    }
}

extension APIRequest: CustomStringConvertible {

    public var description: String {
        var string = "\(service.name): \(service.method) \(path)"
        if !queryParameters.isEmpty {
            string += "?" + queryParameters.map {"\($0)=\($1)"}.joined(separator: "&")
        }
        return string
    }
}

extension APIRequest: CustomDebugStringConvertible {

    public var debugDescription: String {
        var string = description
        if let encodeBody = encodeBody,
            let data = try? encodeBody(JSONEncoder()),
            let bodyString = String(data: data, encoding: .utf8) {
            string += "\nbody: \(bodyString)"
        }
        return string
    }
}

/// A file upload
public struct UploadFile: Equatable {

    public let type: FileType
    public let fileName: String?
    public let mimeType: String?

    public init(type: FileType) {
        self.type = type
        self.fileName = nil
        self.mimeType = nil
    }

    public init(type: FileType, fileName: String, mimeType: String) {
        self.type = type
        self.fileName = fileName
        self.mimeType = mimeType
    }

    public enum FileType: Equatable {
        case data(Data)
        case url(URL)
    }

    func encode() -> Any {
        return self
    }
}

extension URL {
  public var resolvingAgainstBaseURL: Bool { get { return (self.baseURL != nil) } }
}

// Create URLRequest
extension APIRequest {
  
  private func encodeURLParameters(_ urlRequest: URLRequest, with parameters: [String: Any]?) throws -> URLRequest {
    var urlRequest = urlRequest
    guard let parameters = parameters else { return urlRequest }
    guard let url = urlRequest.url else { throw(APIClientError.missingURL) }
    
    if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: url.resolvingAgainstBaseURL), !parameters.isEmpty {
      var queryItems = urlComponents.queryItems ?? []
      let urlQueryItems = parameters.map { (arg0) -> URLQueryItem in
        let (key, value) = arg0
        return URLQueryItem(name: key, value: value as? String)
      }
      queryItems.append(contentsOf: urlQueryItems)
      urlComponents.queryItems = queryItems
      urlRequest.url = urlComponents.url
      return urlRequest
    }
    throw(APIClientError.urlEncodingError)
  }
  
  private func encodeFormParam(_ urlRequest: URLRequest, with parameters: [String: Any]?) throws -> URLRequest {
    var urlRequest = urlRequest
    guard let parameters = parameters else { return urlRequest }
    guard let url = urlRequest.url else { throw(APIClientError.missingURL) }
    
    if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
        urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
    }

    if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: url.resolvingAgainstBaseURL), !parameters.isEmpty {
      var queryItems = urlComponents.queryItems ?? []
      let urlQueryItems = parameters.map { (arg0) -> URLQueryItem in
        let (key, value) = arg0
        return URLQueryItem(name: key, value: value as? String)
      }
      queryItems.append(contentsOf: urlQueryItems)
      urlComponents.queryItems = queryItems
      
      urlRequest.httpBody = urlComponents.queryItems?.map { (queryItem) -> String in
        "\(queryItem.name)=\(queryItem.value)"
      }.joined(separator: "&").data(using: .utf8, allowLossyConversion: false)
    }

    throw(APIClientError.urlEncodingError)
  }


    /// pass in an optional baseURL, otherwise URLRequest.url will be relative
    public func createURLRequest(baseURL: String = "", encoder: RequestEncoder = JSONEncoder()) throws -> URLRequest {
        let url = URL(string: "\(baseURL)\(path)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = service.method
        urlRequest.allHTTPHeaderFields = headers

        // filter out parameters with empty string value
        var queryParams: [String: Any] = [:]
        for (key, value) in queryParameters {
            if String.init(describing: value) != "" {
                queryParams[key] = value
            }
        }
        if !queryParams.isEmpty {
          urlRequest = try encodeURLParameters(urlRequest, with: queryParams)
        }

        var formParams: [String: Any] = [:]
        for (key, value) in formParameters {
            if String.init(describing: value) != "" {
                formParams[key] = value
            }
        }
        if !formParams.isEmpty {
            urlRequest = try encodeFormParam(urlRequest, with: formParams)
        }
        if let encodeBody = encodeBody {
            urlRequest.httpBody = try encodeBody(encoder)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        return urlRequest
    }
}
