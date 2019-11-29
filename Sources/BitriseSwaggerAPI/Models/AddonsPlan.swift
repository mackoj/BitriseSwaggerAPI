//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AddonsPlan: APIBaseModel {

    public var features: [AddonsFeature]?

    public var id: String?

    public var name: String?

    public var price: Int?

    public init(features: [AddonsFeature]? = nil, id: String? = nil, name: String? = nil, price: Int? = nil) {
        self.features = features
        self.id = id
        self.name = name
        self.price = price
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        features = try container.decodeArrayIfPresent("features")
        id = try container.decodeIfPresent("id")
        name = try container.decodeIfPresent("name")
        price = try container.decodeIfPresent("price")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(features, forKey: "features")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(price, forKey: "price")
    }

}
