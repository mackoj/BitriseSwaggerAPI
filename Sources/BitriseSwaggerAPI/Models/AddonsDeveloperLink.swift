//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AddonsDeveloperLink: APIBaseModel {

    public var title: String?

    public var url: String?

    public init(title: String? = nil, url: String? = nil) {
        self.title = title
        self.url = url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        title = try container.decodeIfPresent("title")
        url = try container.decodeIfPresent("url")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(title, forKey: "title")
        try container.encodeIfPresent(url, forKey: "url")
    }

}
