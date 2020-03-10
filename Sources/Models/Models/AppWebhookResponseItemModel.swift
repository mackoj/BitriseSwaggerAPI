//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AppWebhookResponseItemModel: APIModel {

    public var createdAt: String?

    public var events: String?

    public var headers: String?

    public var registeredByAddon: Bool?

    public var slug: String?

    public var updatedAt: String?

    public var url: String?

    public init(createdAt: String? = nil, events: String? = nil, headers: String? = nil, registeredByAddon: Bool? = nil, slug: String? = nil, updatedAt: String? = nil, url: String? = nil) {
        self.createdAt = createdAt
        self.events = events
        self.headers = headers
        self.registeredByAddon = registeredByAddon
        self.slug = slug
        self.updatedAt = updatedAt
        self.url = url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        createdAt = try container.decodeIfPresent("created_at")
        events = try container.decodeIfPresent("events")
        headers = try container.decodeIfPresent("headers")
        registeredByAddon = try container.decodeIfPresent("registered_by_addon")
        slug = try container.decodeIfPresent("slug")
        updatedAt = try container.decodeIfPresent("updated_at")
        url = try container.decodeIfPresent("url")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(createdAt, forKey: "created_at")
        try container.encodeIfPresent(events, forKey: "events")
        try container.encodeIfPresent(headers, forKey: "headers")
        try container.encodeIfPresent(registeredByAddon, forKey: "registered_by_addon")
        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(updatedAt, forKey: "updated_at")
        try container.encodeIfPresent(url, forKey: "url")
    }

}
