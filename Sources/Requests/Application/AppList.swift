//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation
import BitriseAPIModels
import BitriseAPISharedCode

extension BitriseAPI.Application {

    /**
    Get list of the apps

    List all the apps available for the authenticated account, including those that are owned by other users or Organizations.
    */
    public enum AppList {

        public static let service = APIService<Response>(id: "app-list", tag: "application", method: "GET", path: "/apps", hasBody: false, securityRequirement: SecurityRequirement(type: "PersonalAccessToken", scopes: []))

        /** Order of the applications: sort them based on when they were created or the time of their last build */
        public enum SortBy: String, Codable, Equatable, CaseIterable {
            case lastBuildAt = "last_build_at"
            case createdAt = "created_at"
        }

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Order of the applications: sort them based on when they were created or the time of their last build */
                public var sortBy: SortBy?

                /** Slug of the first app in the response */
                public var next: String?

                /** Max number of elements per page (default: 50) */
                public var limit: Int?

                public init(sortBy: SortBy? = nil, next: String? = nil, limit: Int? = nil) {
                    self.sortBy = sortBy
                    self.next = next
                    self.limit = limit
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: AppList.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(sortBy: SortBy? = nil, next: String? = nil, limit: Int? = nil) {
                let options = Options(sortBy: sortBy, next: next, limit: limit)
                self.init(options: options)
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                if let sortBy = options.sortBy?.encode() {
                  params["sort_by"] = sortBy
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
            public typealias SuccessType = AppListResponseModel

            /** OK */
            case status200(AppListResponseModel)

            /** Bad Request */
            case status400(ServiceStandardErrorRespModel)

            /** Unauthorized */
            case status401(ServiceStandardErrorRespModel)

            /** Not Found */
            case status404(ServiceStandardErrorRespModel)

            /** Internal Server Error */
            case status500(ServiceStandardErrorRespModel)

            public var success: AppListResponseModel? {
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
            public var responseResult: APIResponseResult<AppListResponseModel, ServiceStandardErrorRespModel> {
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
                case 200: self = try .status200(decoder.decode(AppListResponseModel.self, from: data))
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