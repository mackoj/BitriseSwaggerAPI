//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation
import BitriseSwaggerAPIModels
import BitriseSwaggerAPISharedCode

extension BitriseSwaggerAPI.Builds {

    /**
    List all builds

    List all the Bitrise builds that can be accessed with the authenticated account. Filter builds based on their owner, using the owner slug, or the status of the build.
    */
    public enum BuildListAll {

        public static let service = APIService<Response>(id: "build-list-all", tag: "builds", method: "GET", path: "/builds", hasBody: false, securityRequirement: SecurityRequirement(type: "PersonalAccessToken", scopes: []))

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The slug of the owner of the app or apps */
                public var ownerSlug: String?

                /** Indicates whether the build has started yet (true: the build hasn't started) */
                public var isOnHold: Bool?

                /** The status of the build: not finished (0), successful (1), failed (2), aborted with failure (3), aborted with success (4) */
                public var status: Int?

                /** Slug of the first build in the response */
                public var next: String?

                /** Max number of elements per page (default: 50) */
                public var limit: Int?

                public init(ownerSlug: String? = nil, isOnHold: Bool? = nil, status: Int? = nil, next: String? = nil, limit: Int? = nil) {
                    self.ownerSlug = ownerSlug
                    self.isOnHold = isOnHold
                    self.status = status
                    self.next = next
                    self.limit = limit
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: BuildListAll.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(ownerSlug: String? = nil, isOnHold: Bool? = nil, status: Int? = nil, next: String? = nil, limit: Int? = nil) {
                let options = Options(ownerSlug: ownerSlug, isOnHold: isOnHold, status: status, next: next, limit: limit)
                self.init(options: options)
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                if let ownerSlug = options.ownerSlug {
                  params["owner_slug"] = ownerSlug
                }
                if let isOnHold = options.isOnHold {
                  params["is_on_hold"] = isOnHold
                }
                if let status = options.status {
                  params["status"] = status
                }
                if let next = options.next {
                  params["next"] = next
                }
                if let limit = options.limit {
                  params["limit"] = limit
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = BuildListAllResponseModel

            /** OK */
            case status200(BuildListAllResponseModel)

            /** Bad Request */
            case status400(ServiceStandardErrorRespModel)

            /** Unauthorized */
            case status401(ServiceStandardErrorRespModel)

            /** Not Found */
            case status404(ServiceStandardErrorRespModel)

            /** Internal Server Error */
            case status500(ServiceStandardErrorRespModel)

            public var success: BuildListAllResponseModel? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: ServiceStandardErrorRespModel? {
                switch self {
                case .status400(let response): return response
                case .status401(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<BuildListAllResponseModel, ServiceStandardErrorRespModel> {
                if let successValue = success {
                    return .success(successValue)
                } else if let failureValue = failure {
                    return .failure(failureValue)
                } else {
                    fatalError("Response does not have success or failure response")
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                case .status400(let response): return response
                case .status401(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status400: return 400
                case .status401: return 401
                case .status404: return 404
                case .status500: return 500
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                case .status401: return false
                case .status404: return false
                case .status500: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(BuildListAllResponseModel.self, from: data))
                case 400: self = try .status400(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
                case 401: self = try .status401(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
                case 404: self = try .status404(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
                case 500: self = try .status500(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
