//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AddonsFeature: APIBaseModel {

    public var available: Bool?

    public var description: String?

    public var quantity: String?

    public init(available: Bool? = nil, description: String? = nil, quantity: String? = nil) {
        self.available = available
        self.description = description
        self.quantity = quantity
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        available = try container.decodeIfPresent("available")
        description = try container.decodeIfPresent("description")
        quantity = try container.decodeIfPresent("quantity")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(available, forKey: "available")
        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(quantity, forKey: "quantity")
    }

}
