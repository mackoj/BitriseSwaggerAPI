//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildParamsEnvironment: APIModel {

    public var isExpand: Bool?

    public var mappedTo: String?

    public var value: String?

    public init(isExpand: Bool? = nil, mappedTo: String? = nil, value: String? = nil) {
        self.isExpand = isExpand
        self.mappedTo = mappedTo
        self.value = value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        isExpand = try container.decodeIfPresent("is_expand")
        mappedTo = try container.decodeIfPresent("mapped_to")
        value = try container.decodeIfPresent("value")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(isExpand, forKey: "is_expand")
        try container.encodeIfPresent(mappedTo, forKey: "mapped_to")
        try container.encodeIfPresent(value, forKey: "value")
    }

}
