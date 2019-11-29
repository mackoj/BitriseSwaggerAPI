//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AvatarPromoteParams: APIBaseModel {

    public var isPromoted: Bool?

    public init(isPromoted: Bool? = nil) {
        self.isPromoted = isPromoted
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        isPromoted = try container.decodeIfPresent("is_promoted")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(isPromoted, forKey: "is_promoted")
    }

}
