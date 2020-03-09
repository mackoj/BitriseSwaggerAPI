//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct WebhookRespModel: APIModel {

    public var status: String?

    public init(status: String? = nil) {
        self.status = status
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        status = try container.decodeIfPresent("status")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(status, forKey: "status")
    }

}
