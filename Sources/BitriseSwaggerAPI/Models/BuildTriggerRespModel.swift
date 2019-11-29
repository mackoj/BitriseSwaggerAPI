//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildTriggerRespModel: APIBaseModel {

    public var buildNumber: Int?

    public var buildSlug: String?

    public var buildURL: String?

    public var message: String?

    public var service: String?

    public var slug: String?

    public var status: String?

    public var triggeredWorkflow: String?

    public init(buildNumber: Int? = nil, buildSlug: String? = nil, buildURL: String? = nil, message: String? = nil, service: String? = nil, slug: String? = nil, status: String? = nil, triggeredWorkflow: String? = nil) {
        self.buildNumber = buildNumber
        self.buildSlug = buildSlug
        self.buildURL = buildURL
        self.message = message
        self.service = service
        self.slug = slug
        self.status = status
        self.triggeredWorkflow = triggeredWorkflow
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        buildNumber = try container.decodeIfPresent("build_number")
        buildSlug = try container.decodeIfPresent("build_slug")
        buildURL = try container.decodeIfPresent("build_url")
        message = try container.decodeIfPresent("message")
        service = try container.decodeIfPresent("service")
        slug = try container.decodeIfPresent("slug")
        status = try container.decodeIfPresent("status")
        triggeredWorkflow = try container.decodeIfPresent("triggered_workflow")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(buildNumber, forKey: "build_number")
        try container.encodeIfPresent(buildSlug, forKey: "build_slug")
        try container.encodeIfPresent(buildURL, forKey: "build_url")
        try container.encodeIfPresent(message, forKey: "message")
        try container.encodeIfPresent(service, forKey: "service")
        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(status, forKey: "status")
        try container.encodeIfPresent(triggeredWorkflow, forKey: "triggered_workflow")
    }

}
