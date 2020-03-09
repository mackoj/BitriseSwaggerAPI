//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AppRespModel: APIBaseModel {

    public var slug: String?

    public var status: String?

    public init(slug: String? = nil, status: String? = nil) {
        self.slug = slug
        self.status = status
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        slug = try container.decodeIfPresent("slug")
        status = try container.decodeIfPresent("status")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(status, forKey: "status")
    }

}
