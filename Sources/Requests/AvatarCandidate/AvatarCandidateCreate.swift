//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation
import BitriseAPIModels
import BitriseAPISharedCode

//extension BitriseAPI.AvatarCandidate {
//
//    /**
//    Create avatar candidates
//
//    Add new avatar candidates to a specific app
//    */
//    public enum AvatarCandidateCreate {
//
//        public static let service = APIService<Response>(id: "avatar-candidate-create", tag: "avatar-candidate", method: "POST", path: "/apps/{app-slug}/avatar-candidates", hasBody: true, securityRequirement: SecurityRequirement(type: "PersonalAccessToken", scopes: []))
//
//        public final class Request: APIRequest<Response> {
//
//            public struct Options {
//
//                /** App slug */
//                public var appSlug: String
//
//                public init(appSlug: String) {
//                    self.appSlug = appSlug
//                }
//            }
//
//            public var options: Options
//
//            public var body: AvatarCandidateCreateBulkParams
//
//            public init(body: AvatarCandidateCreateBulkParams, options: Options, encoder: RequestEncoder? = nil) {
//                self.body = body
//                self.options = options
//                super.init(service: AvatarCandidateCreate.service) { defaultEncoder in
//                    return try (encoder ?? defaultEncoder).encode(body)
//                }
//            }
//
//            /// convenience initialiser so an Option doesn't have to be created
//            public convenience init(appSlug: String, body: AvatarCandidateCreateBulkParams) {
//                let options = Options(appSlug: appSlug)
//                self.init(body: body, options: options)
//            }
//
//            public override var path: String {
//                return super.path.replacingOccurrences(of: "{" + "app-slug" + "}", with: "\(self.options.appSlug)")
//            }
//        }
//
//        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
//            public typealias SuccessType = AvatarCandidateCreateResponseItems
//
//            /** Created */
//            case status201(AvatarCandidateCreateResponseItems)
//
//            /** Bad Request */
//            case status400(ServiceStandardErrorRespModel)
//
//            /** Unauthorized */
//            case status401(ServiceStandardErrorRespModel)
//
//            /** Not Found */
//            case status404(ServiceStandardErrorRespModel)
//
//            /** Internal Server Error */
//            case status500(ServiceStandardErrorRespModel)
//
//            public var success: AvatarCandidateCreateResponseItems? {
//                switch self {
//                case .status201(let response): return response
//                default: return nil
//                }
//            }
//
//            public var failure: ServiceStandardErrorRespModel? {
//                switch self {
//                case .status400(let response): return response
//                case .status401(let response): return response
//                case .status404(let response): return response
//                case .status500(let response): return response
//                default: return nil
//                }
//            }
//
//            /// either success or failure value. Success is anything in the 200..<300 status code range
//            public var responseResult: APIResponseResult<AvatarCandidateCreateResponseItems, ServiceStandardErrorRespModel> {
//                if let successValue = success {
//                    return .success(successValue)
//                } else if let failureValue = failure {
//                    return .failure(failureValue)
//                } else {
//                    fatalError("Response does not have success or failure response")
//                }
//            }
//
//            public var response: Any {
//                switch self {
//                case .status201(let response): return response
//                case .status400(let response): return response
//                case .status401(let response): return response
//                case .status404(let response): return response
//                case .status500(let response): return response
//                }
//            }
//
//            public var statusCode: Int {
//                switch self {
//                case .status201: return 201
//                case .status400: return 400
//                case .status401: return 401
//                case .status404: return 404
//                case .status500: return 500
//                }
//            }
//
//            public var successful: Bool {
//                switch self {
//                case .status201: return true
//                case .status400: return false
//                case .status401: return false
//                case .status404: return false
//                case .status500: return false
//                }
//            }
//
//            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
//                switch statusCode {
//                case 201: self = try .status201(decoder.decode(AvatarCandidateCreateResponseItems.self, from: data))
//                case 400: self = try .status400(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
//                case 401: self = try .status401(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
//                case 404: self = try .status404(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
//                case 500: self = try .status500(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
//                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
//                }
//            }
//
//            public var description: String {
//                return "\(statusCode) \(successful ? "success" : "failure")"
//            }
//
//            public var debugDescription: String {
//                var string = description
//                let responseString = "\(response)"
//                if responseString != "()" {
//                    string += "\n\(responseString)"
//                }
//                return string
//            }
//        }
//    }
//}
