//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AddonsSetupGuide: APIBaseModel {

    public var instructions: [AddonsSetupInstruction]?

    public var notification: String?

    public init(instructions: [AddonsSetupInstruction]? = nil, notification: String? = nil) {
        self.instructions = instructions
        self.notification = notification
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        instructions = try container.decodeArrayIfPresent("instructions")
        notification = try container.decodeIfPresent("notification")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(instructions, forKey: "instructions")
        try container.encodeIfPresent(notification, forKey: "notification")
    }

}
