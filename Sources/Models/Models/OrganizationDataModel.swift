//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct OrganizationDataModel: APIModel {

    public var avatarIconURL: String?

    public var concurrencyCount: Int?

    public var name: String?

    public var owners: [OrganizationOwner]?

    public var slug: String?

    public init(avatarIconURL: String? = nil, concurrencyCount: Int? = nil, name: String? = nil, owners: [OrganizationOwner]? = nil, slug: String? = nil) {
        self.avatarIconURL = avatarIconURL
        self.concurrencyCount = concurrencyCount
        self.name = name
        self.owners = owners
        self.slug = slug
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        avatarIconURL = try container.decodeIfPresent("avatar_icon_url")
        concurrencyCount = try container.decodeIfPresent("concurrency_count")
        name = try container.decodeIfPresent("name")
        owners = try container.decodeArrayIfPresent("owners")
        slug = try container.decodeIfPresent("slug")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(avatarIconURL, forKey: "avatar_icon_url")
        try container.encodeIfPresent(concurrencyCount, forKey: "concurrency_count")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(owners, forKey: "owners")
        try container.encodeIfPresent(slug, forKey: "slug")
    }

}
