//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation
import BitriseAPIModels
import BitriseAPISharedCode

extension BitriseAPI.OutgoingWebhook {

    /**
    List the outgoing webhooks of an app

    List all the outgoing webhooks registered for a specified Bitrise app. This returns all the relevant data of the webhook, including the slug of the webhook and its URL.
    */
    public enum OutgoingWebhookList {

        public static let service = APIService<Response>(id: "outgoing-webhook-list", tag: "outgoing-webhook", method: "GET", path: "/apps/{app-slug}/outgoing-webhooks", hasBody: false, securityRequirement: SecurityRequirement(type: "PersonalAccessToken", scopes: []))

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** App slug */
                public var appSlug: String

                /** Slug of the first webhook in the response */
                public var next: String?

                /** Max number of elements per page (default: 50) */
                public var limit: Int?

                public init(appSlug: String, next: String? = nil, limit: Int? = nil) {
                    self.appSlug = appSlug
                    self.next = next
                    self.limit = limit
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: OutgoingWebhookList.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(appSlug: String, next: String? = nil, limit: Int? = nil) {
                let options = Options(appSlug: appSlug, next: next, limit: limit)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "app-slug" + "}", with: "\(self.options.appSlug)")
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
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
            public typealias SuccessType = AppWebhookListResponseModel

            /** OK */
            case status200(AppWebhookListResponseModel)

            /** Bad Request */
            case status400(ServiceStandardErrorRespModel)

            /** Unauthorized */
            case status401(ServiceStandardErrorRespModel)

            /** Internal Server Error */
            case status500(ServiceStandardErrorRespModel)

            public var success: AppWebhookListResponseModel? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: ServiceStandardErrorRespModel? {
                switch self {
                case .status400(let response): return response
                case .status401(let response): return response
                case .status500(let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<AppWebhookListResponseModel, ServiceStandardErrorRespModel> {
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
                case .status500(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status400: return 400
                case .status401: return 401
                case .status500: return 500
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                case .status401: return false
                case .status500: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(AppWebhookListResponseModel.self, from: data))
                case 400: self = try .status400(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
                case 401: self = try .status401(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
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
