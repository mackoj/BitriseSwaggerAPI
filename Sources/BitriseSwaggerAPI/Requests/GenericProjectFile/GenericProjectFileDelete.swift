//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

extension BitriseAPI.GenericProjectFile {

    /**
    Delete a generic project file

    Delete an app's generic project file. You can fetch an app's generic project file slug if you first list all the uploaded files with the [GET /apps/{app-slug}/generic-project-files](https://api-docs.bitrise.io/#/generic-project-file/generic-project-file-list) endpoint. Read more in our [Deleting a file](https://devcenter.bitrise.io/api/managing-files-in-generic-file-storage/#deleting-a-file) guide.
    */
    public enum GenericProjectFileDelete {

        public static let service = APIService<Response>(id: "generic-project-file-delete", tag: "generic-project-file", method: "DELETE", path: "/apps/{app-slug}/generic-project-files/{generic-project-file-slug}", hasBody: false, securityRequirement: SecurityRequirement(type: "PersonalAccessToken", scopes: []))

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** App slug */
                public var appSlug: String

                /** Generic project file slug */
                public var genericProjectFileSlug: String

                public init(appSlug: String, genericProjectFileSlug: String) {
                    self.appSlug = appSlug
                    self.genericProjectFileSlug = genericProjectFileSlug
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GenericProjectFileDelete.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(appSlug: String, genericProjectFileSlug: String) {
                let options = Options(appSlug: appSlug, genericProjectFileSlug: genericProjectFileSlug)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "app-slug" + "}", with: "\(self.options.appSlug)").replacingOccurrences(of: "{" + "generic-project-file-slug" + "}", with: "\(self.options.genericProjectFileSlug)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = ProjectFileStorageResponseModel

            /** OK */
            case status200(ProjectFileStorageResponseModel)

            /** Bad Request */
            case status400(ServiceStandardErrorRespModel)

            /** Unauthorized */
            case status401(ServiceStandardErrorRespModel)

            /** Not Found */
            case status404(ServiceStandardErrorRespModel)

            /** Internal Server Error */
            case status500(ServiceStandardErrorRespModel)

            public var success: ProjectFileStorageResponseModel? {
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
            public var responseResult: APIResponseResult<ProjectFileStorageResponseModel, ServiceStandardErrorRespModel> {
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
                case 200: self = try .status200(decoder.decode(ProjectFileStorageResponseModel.self, from: data))
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
