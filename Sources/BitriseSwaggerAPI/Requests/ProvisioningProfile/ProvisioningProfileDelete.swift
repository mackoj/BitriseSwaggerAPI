//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

extension BitriseAPI.ProvisioningProfile {

    /**
    Delete a provisioning profile

    Delete an app's provisioning profile. You can fetch the provisioning profile's slug if you call the [GET /apps/{app-slug}/provisioning-profiles](https://api-docs.bitrise.io/#/provisioning-profile/provisioning-profile-list) endpoint. Read more in our [Deleting an iOS code signing file](https://devcenter.bitrise.io/api/managing-ios-code-signing-files/#deleting-an-ios-code-signing-file) guide.
    */
    public enum ProvisioningProfileDelete {

        public static let service = APIService<Response>(id: "provisioning-profile-delete", tag: "provisioning-profile", method: "DELETE", path: "/apps/{app-slug}/provisioning-profiles/{provisioning-profile-slug}", hasBody: false, securityRequirement: SecurityRequirement(type: "PersonalAccessToken", scopes: []))

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** App slug */
                public var appSlug: String

                /** Provisioning profile slug */
                public var provisioningProfileSlug: String

                public init(appSlug: String, provisioningProfileSlug: String) {
                    self.appSlug = appSlug
                    self.provisioningProfileSlug = provisioningProfileSlug
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: ProvisioningProfileDelete.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(appSlug: String, provisioningProfileSlug: String) {
                let options = Options(appSlug: appSlug, provisioningProfileSlug: provisioningProfileSlug)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "app-slug" + "}", with: "\(self.options.appSlug)").replacingOccurrences(of: "{" + "provisioning-profile-slug" + "}", with: "\(self.options.provisioningProfileSlug)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = ProvisionProfileResponseModel

            /** OK */
            case status200(ProvisionProfileResponseModel)

            /** Bad Request */
            case status400(ServiceStandardErrorRespModel)

            /** Unauthorized */
            case status401(ServiceStandardErrorRespModel)

            /** Not Found */
            case status404(ServiceStandardErrorRespModel)

            /** Internal Server Error */
            case status500(ServiceStandardErrorRespModel)

            public var success: ProvisionProfileResponseModel? {
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
            public var responseResult: APIResponseResult<ProvisionProfileResponseModel, ServiceStandardErrorRespModel> {
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
                case 200: self = try .status200(decoder.decode(ProvisionProfileResponseModel.self, from: data))
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
