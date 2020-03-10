//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildTriggerParams: APIModel {

    public var buildParams: BuildTriggerParamsBuildParams?

    public var hookInfo: BuildTriggerParamsHookInfo?

    public init(buildParams: BuildTriggerParamsBuildParams? = nil, hookInfo: BuildTriggerParamsHookInfo? = nil) {
        self.buildParams = buildParams
        self.hookInfo = hookInfo
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        buildParams = try container.decodeIfPresent("build_params")
        hookInfo = try container.decodeIfPresent("hook_info")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(buildParams, forKey: "build_params")
        try container.encodeIfPresent(hookInfo, forKey: "hook_info")
    }

}
