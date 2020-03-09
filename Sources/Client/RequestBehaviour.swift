//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation
import BitriseAPIRequests
import BitriseAPISharedCode

public protocol RequestBehaviour {

    /// runs first and allows the requests to be modified. If modifying asynchronously use validate
    func modifyRequest(request: AnyRequest, urlRequest: URLRequest) -> URLRequest

    /// validates and modifies the request. complete must be called with either .success or .fail
    func validate(request: AnyRequest, urlRequest: URLRequest, complete: @escaping (RequestValidationResult) -> Void)

    /// called before request is sent
    func beforeSend(request: AnyRequest)

    /// called when request successfuly returns a 200 range response
    func onSuccess(request: AnyRequest, result: Any)

    /// called when request fails with an error. This will not be called if the request returns a known response even if the a status code is out of the 200 range
    func onFailure(request: AnyRequest, error: APIClientError)

    /// called if the request recieves a network response. This is not called if request fails validation or encoding
    func onResponse(request: AnyRequest, response: AnyResponse)
}

public enum RequestValidationResult {
    case success(URLRequest)
    case failure(Error)
}

// Provides empty defaults so that each function becomes optional
public extension RequestBehaviour {
    func modifyRequest(request: AnyRequest, urlRequest: URLRequest) -> URLRequest { return urlRequest }
    func validate(request: AnyRequest, urlRequest: URLRequest, complete: @escaping (RequestValidationResult) -> Void) {
        complete(.success(urlRequest))
    }
    func beforeSend(request: AnyRequest) {}
    func onSuccess(request: AnyRequest, result: Any) {}
    func onFailure(request: AnyRequest, error: APIClientError) {}
    func onResponse(request: AnyRequest, response: AnyResponse) {}
}

// Group different RequestBehaviours together
struct RequestBehaviourGroup {

    let request: AnyRequest
    let behaviours: [RequestBehaviour]

    init<T>(request: APIRequest<T>, behaviours: [RequestBehaviour]) {
        self.request = request.asAny()
        self.behaviours = behaviours
    }

    func beforeSend() {
        behaviours.forEach {
            $0.beforeSend(request: request)
        }
    }

    func validate(_ urlRequest: URLRequest, complete: @escaping (RequestValidationResult) -> Void) {
        if behaviours.isEmpty {
            complete(.success(urlRequest))
            return
        }

        var count = 0
        var modifiedRequest = urlRequest
        func validateNext() {
            let behaviour = behaviours[count]
            behaviour.validate(request: request, urlRequest: modifiedRequest) { result in
                count += 1
                switch result {
                case .success(let urlRequest):
                    modifiedRequest = urlRequest
                    if count == self.behaviours.count {
                        complete(.success(modifiedRequest))
                    } else {
                        validateNext()
                    }
                case .failure(let error):
                    complete(.failure(error))
                }
            }
        }
        validateNext()
    }

    func onSuccess(result: Any) {
        behaviours.forEach {
            $0.onSuccess(request: request, result: result)
        }
    }

    func onFailure(error: APIClientError) {
        behaviours.forEach {
            $0.onFailure(request: request, error: error)
        }
    }

    func onResponse(response: AnyResponse) {
        behaviours.forEach {
            $0.onResponse(request: request, response: response)
        }
    }

    func modifyRequest(_ urlRequest: URLRequest) -> URLRequest {
        var urlRequest = urlRequest
        behaviours.forEach {
            urlRequest = $0.modifyRequest(request: request, urlRequest: urlRequest)
        }
        return urlRequest
    }
}
