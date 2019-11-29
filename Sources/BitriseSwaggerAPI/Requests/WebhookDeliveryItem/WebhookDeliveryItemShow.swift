//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

extension BitriseAPI.WebhookDeliveryItem {

    /**
    Get a specific delivery item of a webhook

    Get the specified delivery item of an outgoing webhook of a Bitrise application
    */
    public enum WebhookDeliveryItemShow {

        public static let service = APIService<Response>(id: "webhook-delivery-item-show", tag: "webhook-delivery-item", method: "GET", path: "/apps/{app-slug}/outgoing-webhooks/{app-webhook-slug}/delivery-items/{webhook-delivery-item-slug}", hasBody: false, securityRequirement: SecurityRequirement(type: "PersonalAccessToken", scopes: []))

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** App slug */
                public var appSlug: String

                /** App webhook slug */
                public var appWebhookSlug: String

                /** Webhook delivery item slug */
                public var webhookDeliveryItemSlug: String

                public init(appSlug: String, appWebhookSlug: String, webhookDeliveryItemSlug: String) {
                    self.appSlug = appSlug
                    self.appWebhookSlug = appWebhookSlug
                    self.webhookDeliveryItemSlug = webhookDeliveryItemSlug
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: WebhookDeliveryItemShow.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(appSlug: String, appWebhookSlug: String, webhookDeliveryItemSlug: String) {
                let options = Options(appSlug: appSlug, appWebhookSlug: appWebhookSlug, webhookDeliveryItemSlug: webhookDeliveryItemSlug)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "app-slug" + "}", with: "\(self.options.appSlug)").replacingOccurrences(of: "{" + "app-webhook-slug" + "}", with: "\(self.options.appWebhookSlug)").replacingOccurrences(of: "{" + "webhook-delivery-item-slug" + "}", with: "\(self.options.webhookDeliveryItemSlug)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = WebhookDeliveryItemResponseModel

            /** OK */
            case status200(WebhookDeliveryItemResponseModel)

            /** Bad Request */
            case status400(ServiceStandardErrorRespModel)

            /** Unauthorized */
            case status401(ServiceStandardErrorRespModel)

            /** Internal Server Error */
            case status500(ServiceStandardErrorRespModel)

            public var success: WebhookDeliveryItemResponseModel? {
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
            public var responseResult: APIResponseResult<WebhookDeliveryItemResponseModel, ServiceStandardErrorRespModel> {
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
                case 200: self = try .status200(decoder.decode(WebhookDeliveryItemResponseModel.self, from: data))
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
