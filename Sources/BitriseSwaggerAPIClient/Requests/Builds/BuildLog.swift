//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation
import BitriseSwaggerAPI


extension BitriseAPI.Builds {

    /**
    Get the build log of a build

    Get the build log of a specified build of a Bitrise app. You can get the build slug either by calling the [/builds](https://api-docs.bitrise.io/#/builds/build-list) endpoint or by clicking on the build on bitrise.io and copying the slug from the URL.
    */
    public enum BuildLog {

        public static let service = APIService<Response>(id: "build-log", tag: "builds", method: "GET", path: "/apps/{app-slug}/builds/{build-slug}/log", hasBody: false, securityRequirement: SecurityRequirement(type: "PersonalAccessToken", scopes: []))

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** App slug */
                public var appSlug: String

                /** Build slug */
                public var buildSlug: String

                public init(appSlug: String, buildSlug: String) {
                    self.appSlug = appSlug
                    self.buildSlug = buildSlug
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: BuildLog.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(appSlug: String, buildSlug: String) {
                let options = Options(appSlug: appSlug, buildSlug: buildSlug)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "app-slug" + "}", with: "\(self.options.appSlug)").replacingOccurrences(of: "{" + "build-slug" + "}", with: "\(self.options.buildSlug)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = BuildLogInfoResponseModel

            /** OK */
            case status200(BuildLogInfoResponseModel)

            /** Bad Request */
            case status400(ServiceStandardErrorRespModel)

            /** Unauthorized */
            case status401(ServiceStandardErrorRespModel)

            /** Not Found */
            case status404(ServiceStandardErrorRespModel)

            /** Internal Server Error */
            case status500(ServiceStandardErrorRespModel)

            public var success: BuildLogInfoResponseModel? {
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
            public var responseResult: APIResponseResult<BuildLogInfoResponseModel, ServiceStandardErrorRespModel> {
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
                case 200: self = try .status200(decoder.decode(BuildLogInfoResponseModel.self, from: data))
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
