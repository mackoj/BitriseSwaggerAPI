//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct PlanDataModel: APIBaseModel {

    public var containerCount: Int?

    public var expiresAt: String?

    public var id: String?

    public var name: String?

    public var price: String?

    public init(containerCount: Int? = nil, expiresAt: String? = nil, id: String? = nil, name: String? = nil, price: String? = nil) {
        self.containerCount = containerCount
        self.expiresAt = expiresAt
        self.id = id
        self.name = name
        self.price = price
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        containerCount = try container.decodeIfPresent("container_count")
        expiresAt = try container.decodeIfPresent("expires_at")
        id = try container.decodeIfPresent("id")
        name = try container.decodeIfPresent("name")
        price = try container.decodeIfPresent("price")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(containerCount, forKey: "container_count")
        try container.encodeIfPresent(expiresAt, forKey: "expires_at")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(price, forKey: "price")
    }

}
