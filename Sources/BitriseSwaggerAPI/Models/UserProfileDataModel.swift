//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct UserProfileDataModel: APIBaseModel {

    public var avatarURL: String?

    public var email: String?

    public var isChatAvailable: Bool?

    public var slug: String?

    public var unconfirmedEmail: String?

    public var username: String?

    public init(avatarURL: String? = nil, email: String? = nil, isChatAvailable: Bool? = nil, slug: String? = nil, unconfirmedEmail: String? = nil, username: String? = nil) {
        self.avatarURL = avatarURL
        self.email = email
        self.isChatAvailable = isChatAvailable
        self.slug = slug
        self.unconfirmedEmail = unconfirmedEmail
        self.username = username
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        avatarURL = try container.decodeIfPresent("avatar_url")
        email = try container.decodeIfPresent("email")
        isChatAvailable = try container.decodeIfPresent("is_chat_available")
        slug = try container.decodeIfPresent("slug")
        unconfirmedEmail = try container.decodeIfPresent("unconfirmed_email")
        username = try container.decodeIfPresent("username")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(avatarURL, forKey: "avatar_url")
        try container.encodeIfPresent(email, forKey: "email")
        try container.encodeIfPresent(isChatAvailable, forKey: "is_chat_available")
        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(unconfirmedEmail, forKey: "unconfirmed_email")
        try container.encodeIfPresent(username, forKey: "username")
    }

}
