//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation
import BitriseSwaggerAPIModels
import BitriseSwaggerAPISharedCode

extension BitriseSwaggerAPI.BuildArtifact {

    /**
    Update a build artifact

    Update the `is_public_page_enabled` attribute of your app's build. The required parameters are app slug, build slug and artifact slug. You can fetch the build artifact slug if you first list all build artifacts of an app with the [GET /apps/](https://api-docs.bitrise.io/#/build-artifact/artifact-list) endpoint.
    */
    public enum ArtifactUpdate {

        public static let service = APIService<Response>(id: "artifact-update", tag: "build-artifact", method: "PATCH", path: "/apps/{app-slug}/builds/{build-slug}/artifacts/{artifact-slug}", hasBody: true, securityRequirement: SecurityRequirement(type: "PersonalAccessToken", scopes: []))

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** App slug */
                public var appSlug: String

                /** Build slug */
                public var buildSlug: String

                /** Artifact slug */
                public var artifactSlug: String

                public init(appSlug: String, buildSlug: String, artifactSlug: String) {
                    self.appSlug = appSlug
                    self.buildSlug = buildSlug
                    self.artifactSlug = artifactSlug
                }
            }

            public var options: Options

            public var body: ArtifactUpdateParams

            public init(body: ArtifactUpdateParams, options: Options, encoder: RequestEncoder? = nil) {
                self.body = body
                self.options = options
                super.init(service: ArtifactUpdate.service) { defaultEncoder in
                    return try (encoder ?? defaultEncoder).encode(body)
                }
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(appSlug: String, buildSlug: String, artifactSlug: String, body: ArtifactUpdateParams) {
                let options = Options(appSlug: appSlug, buildSlug: buildSlug, artifactSlug: artifactSlug)
                self.init(body: body, options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "app-slug" + "}", with: "\(self.options.appSlug)").replacingOccurrences(of: "{" + "build-slug" + "}", with: "\(self.options.buildSlug)").replacingOccurrences(of: "{" + "artifact-slug" + "}", with: "\(self.options.artifactSlug)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = ArtifactShowResponseModel

            /** OK */
            case status200(ArtifactShowResponseModel)

            /** Bad Request */
            case status400(ServiceStandardErrorRespModel)

            /** Unauthorized */
            case status401(ServiceStandardErrorRespModel)

            /** Not Found */
            case status404(ServiceStandardErrorRespModel)

            /** Internal Server Error */
            case status500(ServiceStandardErrorRespModel)

            public var success: ArtifactShowResponseModel? {
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
            public var responseResult: APIResponseResult<ArtifactShowResponseModel, ServiceStandardErrorRespModel> {
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
                case 200: self = try .status200(decoder.decode(ArtifactShowResponseModel.self, from: data))
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
