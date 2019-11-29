//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct ArtifactUpdateParams: APIBaseModel {

    public var isPublicPageEnabled: Bool?

    public init(isPublicPageEnabled: Bool? = nil) {
        self.isPublicPageEnabled = isPublicPageEnabled
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        isPublicPageEnabled = try container.decodeIfPresent("is_public_page_enabled")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(isPublicPageEnabled, forKey: "is_public_page_enabled")
    }

}
