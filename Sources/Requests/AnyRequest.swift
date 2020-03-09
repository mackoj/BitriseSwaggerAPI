//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation
import BitriseAPIModels

//MARK: Type erased Requests and Responses

public typealias AnyResponse = APIResponse<AnyResponseValue>

public class AnyRequest: APIRequest<AnyResponseValue> {
    private let requestPath: String

    override public var path: String {
        return requestPath
    }

    init<T>(request: APIRequest<T>) {
        requestPath = request.path
        super.init(service: request.service.asAny(), queryParameters: request.queryParameters, formParameters: request.formParameters, headers: request.headers, encodeBody: request.encodeBody)
    }
}

public struct AnyResponseValue: APIResponseValue, CustomDebugStringConvertible, CustomStringConvertible {

    public typealias SuccessType = AnyCodable

    public let statusCode: Int
    public let successful: Bool
    public let response: Any
    public let responseEnum: Any
    public let success: AnyCodable?

    public init(statusCode: Int, successful: Bool, response: Any, responseEnum: Any, success: AnyCodable?) {
        self.statusCode = statusCode
        self.successful = successful
        self.response = response
        self.responseEnum = responseEnum
        self.success = success
    }

    public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
        fatalError()
    }

    public var description:String {
        return "\(responseEnum)"
    }

    public var debugDescription: String {
        if let debugDescription = responseEnum as? CustomDebugStringConvertible {
            return debugDescription.debugDescription
        } else {
            return "\(responseEnum)"
        }
    }
}

extension APIResponseValue {
    public func asAny() -> AnyResponseValue {
        return AnyResponseValue(statusCode: statusCode, successful: successful, response: response, responseEnum: self, success: AnyCodable(success))
    }
}

extension APIResponse {
    public func asAny() -> APIResponse<AnyResponseValue> {
        return APIResponse<AnyResponseValue>(request: request.asAny(), result: result.map{ $0.asAny() }, urlRequest: urlRequest, urlResponse: urlResponse, data: data)
    }
}

extension APIRequest {
    public func asAny() -> AnyRequest {
        return AnyRequest(request: self)
    }
}

extension APIService {
    public func asAny() -> APIService<AnyResponseValue> {
        return APIService<AnyResponseValue>(id: id, tag: tag, method: method, path: path, hasBody: hasBody, securityRequirement: securityRequirement)
    }
}
