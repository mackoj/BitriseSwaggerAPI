//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildAbortParams: APIModel {

    public var abortReason: String?

    public var abortWithSuccess: Bool?

    public var skipNotifications: Bool?

    public init(abortReason: String? = nil, abortWithSuccess: Bool? = nil, skipNotifications: Bool? = nil) {
        self.abortReason = abortReason
        self.abortWithSuccess = abortWithSuccess
        self.skipNotifications = skipNotifications
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        abortReason = try container.decodeIfPresent("abort_reason")
        abortWithSuccess = try container.decodeIfPresent("abort_with_success")
        skipNotifications = try container.decodeIfPresent("skip_notifications")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(abortReason, forKey: "abort_reason")
        try container.encodeIfPresent(abortWithSuccess, forKey: "abort_with_success")
        try container.encodeIfPresent(skipNotifications, forKey: "skip_notifications")
    }

}
