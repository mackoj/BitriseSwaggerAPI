//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct OrganizationOwner: APIModel {

    public var email: String?

    public var slug: String?

    public var username: String?

    public init(email: String? = nil, slug: String? = nil, username: String? = nil) {
        self.email = email
        self.slug = slug
        self.username = username
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        email = try container.decodeIfPresent("email")
        slug = try container.decodeIfPresent("slug")
        username = try container.decodeIfPresent("username")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(email, forKey: "email")
        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(username, forKey: "username")
    }

}
