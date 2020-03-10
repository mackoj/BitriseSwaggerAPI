//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct OwnerAccountResponseModel: APIModel {

    public var accountType: String?

    public var name: String?

    public var slug: String?

    public init(accountType: String? = nil, name: String? = nil, slug: String? = nil) {
        self.accountType = accountType
        self.name = name
        self.slug = slug
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        accountType = try container.decodeIfPresent("account_type")
        name = try container.decodeIfPresent("name")
        slug = try container.decodeIfPresent("slug")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(accountType, forKey: "account_type")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(slug, forKey: "slug")
    }

}
