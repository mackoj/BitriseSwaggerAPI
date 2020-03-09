//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildRequestUpdateParams: APIModel {

    public var isApproved: Bool?

    public init(isApproved: Bool? = nil) {
        self.isApproved = isApproved
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        isApproved = try container.decodeIfPresent("is_approved")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(isApproved, forKey: "is_approved")
    }

}
