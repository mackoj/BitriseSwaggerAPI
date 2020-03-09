//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct ServiceStandardErrorRespModel: APIBaseModel {

    public var message: String?

    public init(message: String? = nil) {
        self.message = message
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        message = try container.decodeIfPresent("message")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(message, forKey: "message")
    }

}
