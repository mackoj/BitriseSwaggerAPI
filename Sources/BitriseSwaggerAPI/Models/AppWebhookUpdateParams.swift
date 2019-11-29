//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AppWebhookUpdateParams: APIBaseModel {

    public var events: String?

    public var headers: String?

    public var url: String?

    public init(events: String? = nil, headers: String? = nil, url: String? = nil) {
        self.events = events
        self.headers = headers
        self.url = url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        events = try container.decodeIfPresent("events")
        headers = try container.decodeIfPresent("headers")
        url = try container.decodeIfPresent("url")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(events, forKey: "events")
        try container.encodeIfPresent(headers, forKey: "headers")
        try container.encodeIfPresent(url, forKey: "url")
    }

}
