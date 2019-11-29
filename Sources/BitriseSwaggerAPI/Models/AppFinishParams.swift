//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AppFinishParams: APIBaseModel {

    /** Which config to use `default-android-config`, `default-cordova-config`, `default-fastlane-config`, `default-ionic-config`, `default-ios-config`,`default-macos-config`, `default-react-native-config`, `default-xamarin-config`, `other-config` (default if parameter is not speficied) */
    public var config: String?

    /** Environment variables for the application workflows, e.g. {"env1":"val1","env2":"val2"} */
    public var envs: [String: String]?

    /** config specification mode, has to be specified with `manual` value */
    public var mode: String?

    /** The slug of the organization, who will be the owner of the application, if it's not specified, then the authenticated user will be the owner */
    public var organizationSlug: String?

    /** The type of your project (`android`, `ios`, `cordova`, `other`, `xamarin`, `macos`, `ionic`, `react-native`, `fastlane`, null) */
    public var projectType: String?

    /** The id of the stack the application will be built (these can be found in the [system report](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports) file names) */
    public var stackId: String?

    public init(config: String? = nil, envs: [String: String]? = nil, mode: String? = nil, organizationSlug: String? = nil, projectType: String? = nil, stackId: String? = nil) {
        self.config = config
        self.envs = envs
        self.mode = mode
        self.organizationSlug = organizationSlug
        self.projectType = projectType
        self.stackId = stackId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        config = try container.decodeIfPresent("config")
        envs = try container.decodeIfPresent("envs")
        mode = try container.decodeIfPresent("mode")
        organizationSlug = try container.decodeIfPresent("organization_slug")
        projectType = try container.decodeIfPresent("project_type")
        stackId = try container.decodeIfPresent("stack_id")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(config, forKey: "config")
        try container.encodeIfPresent(envs, forKey: "envs")
        try container.encodeIfPresent(mode, forKey: "mode")
        try container.encodeIfPresent(organizationSlug, forKey: "organization_slug")
        try container.encodeIfPresent(projectType, forKey: "project_type")
        try container.encodeIfPresent(stackId, forKey: "stack_id")
    }

}
