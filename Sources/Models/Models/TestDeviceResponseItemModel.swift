//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct TestDeviceResponseItemModel: APIModel {

    public var deviceId: String?

    public var deviceType: String?

    public var owner: String?

    public init(deviceId: String? = nil, deviceType: String? = nil, owner: String? = nil) {
        self.deviceId = deviceId
        self.deviceType = deviceType
        self.owner = owner
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        deviceId = try container.decodeIfPresent("device_id")
        deviceType = try container.decodeIfPresent("device_type")
        owner = try container.decodeIfPresent("owner")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(deviceId, forKey: "device_id")
        try container.encodeIfPresent(deviceType, forKey: "device_type")
        try container.encodeIfPresent(owner, forKey: "owner")
    }

}
