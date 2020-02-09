//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation
import BitriseSwaggerAPI


extension BitriseAPI.Organizations {

    /**
    Get a specified organization.

    Get a specified Bitrise organization that the user is part of.
    */
    public enum OrgShow {

        public static let service = APIService<Response>(id: "org-show", tag: "organizations", method: "GET", path: "/organizations/{org-slug}", hasBody: false, securityRequirement: SecurityRequirement(type: "PersonalAccessToken", scopes: []))

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The organization slug */
                public var orgSlug: String

                public init(orgSlug: String) {
                    self.orgSlug = orgSlug
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: OrgShow.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(orgSlug: String) {
                let options = Options(orgSlug: orgSlug)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "org-slug" + "}", with: "\(self.options.orgSlug)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = OrganizationRespModel

            /** OK */
            case status200(OrganizationRespModel)

            /** Bad Request */
            case status400(ServiceStandardErrorRespModel)

            /** Unauthorized */
            case status401(ServiceStandardErrorRespModel)

            /** Not Found */
            case status404(ServiceStandardErrorRespModel)

            /** Internal Server Error */
            case status500(ServiceStandardErrorRespModel)

            public var success: OrganizationRespModel? {
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
            public var responseResult: APIResponseResult<OrganizationRespModel, ServiceStandardErrorRespModel> {
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
                case 200: self = try .status200(decoder.decode(OrganizationRespModel.self, from: data))
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
