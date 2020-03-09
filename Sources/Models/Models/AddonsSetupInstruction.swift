//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AddonsSetupInstruction: APIBaseModel {

    public var cardContent: String?

    public var description: String?

    public var type: String?

    public init(cardContent: String? = nil, description: String? = nil, type: String? = nil) {
        self.cardContent = cardContent
        self.description = description
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        cardContent = try container.decodeIfPresent("card_content")
        description = try container.decodeIfPresent("description")
        type = try container.decodeIfPresent("type")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(cardContent, forKey: "card_content")
        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(type, forKey: "type")
    }

}
