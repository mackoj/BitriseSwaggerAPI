//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct WebhookDeliveryItemResponseModel: APIBaseModel {

    public var createdAt: String?

    public var requestHeaders: String?

    public var requestPayload: String?

    public var requestURL: String?

    public var responseBody: String?

    public var responseHeaders: String?

    public var responseHttpStatus: String?

    public var responseSeconds: String?

    public var slug: String?

    public var updatedAt: String?

    public init(createdAt: String? = nil, requestHeaders: String? = nil, requestPayload: String? = nil, requestURL: String? = nil, responseBody: String? = nil, responseHeaders: String? = nil, responseHttpStatus: String? = nil, responseSeconds: String? = nil, slug: String? = nil, updatedAt: String? = nil) {
        self.createdAt = createdAt
        self.requestHeaders = requestHeaders
        self.requestPayload = requestPayload
        self.requestURL = requestURL
        self.responseBody = responseBody
        self.responseHeaders = responseHeaders
        self.responseHttpStatus = responseHttpStatus
        self.responseSeconds = responseSeconds
        self.slug = slug
        self.updatedAt = updatedAt
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        createdAt = try container.decodeIfPresent("created_at")
        requestHeaders = try container.decodeIfPresent("request_headers")
        requestPayload = try container.decodeIfPresent("request_payload")
        requestURL = try container.decodeIfPresent("request_url")
        responseBody = try container.decodeIfPresent("response_body")
        responseHeaders = try container.decodeIfPresent("response_headers")
        responseHttpStatus = try container.decodeIfPresent("response_http_status")
        responseSeconds = try container.decodeIfPresent("response_seconds")
        slug = try container.decodeIfPresent("slug")
        updatedAt = try container.decodeIfPresent("updated_at")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(createdAt, forKey: "created_at")
        try container.encodeIfPresent(requestHeaders, forKey: "request_headers")
        try container.encodeIfPresent(requestPayload, forKey: "request_payload")
        try container.encodeIfPresent(requestURL, forKey: "request_url")
        try container.encodeIfPresent(responseBody, forKey: "response_body")
        try container.encodeIfPresent(responseHeaders, forKey: "response_headers")
        try container.encodeIfPresent(responseHttpStatus, forKey: "response_http_status")
        try container.encodeIfPresent(responseSeconds, forKey: "response_seconds")
        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(updatedAt, forKey: "updated_at")
    }

}
