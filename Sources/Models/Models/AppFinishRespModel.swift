//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AppFinishRespModel: APIModel {

    public var branchName: String?

    public var buildTriggerToken: String?

    public var isWebhookAutoRegSupported: Bool?

    public var status: String?

    public init(branchName: String? = nil, buildTriggerToken: String? = nil, isWebhookAutoRegSupported: Bool? = nil, status: String? = nil) {
        self.branchName = branchName
        self.buildTriggerToken = buildTriggerToken
        self.isWebhookAutoRegSupported = isWebhookAutoRegSupported
        self.status = status
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        branchName = try container.decodeIfPresent("branch_name")
        buildTriggerToken = try container.decodeIfPresent("build_trigger_token")
        isWebhookAutoRegSupported = try container.decodeIfPresent("is_webhook_auto_reg_supported")
        status = try container.decodeIfPresent("status")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(branchName, forKey: "branch_name")
        try container.encodeIfPresent(buildTriggerToken, forKey: "build_trigger_token")
        try container.encodeIfPresent(isWebhookAutoRegSupported, forKey: "is_webhook_auto_reg_supported")
        try container.encodeIfPresent(status, forKey: "status")
    }

}
