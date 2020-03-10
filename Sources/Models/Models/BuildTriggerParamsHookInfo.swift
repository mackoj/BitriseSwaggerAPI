//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildTriggerParamsHookInfo: APIModel {

    /** Should be "bitrise" */
    public var type: String?

    public init(type: String? = nil) {
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        type = try container.decodeIfPresent("type")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(type, forKey: "type")
    }

}
