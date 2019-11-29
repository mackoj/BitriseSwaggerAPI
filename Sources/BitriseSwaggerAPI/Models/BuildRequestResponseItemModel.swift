//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildRequestResponseItemModel: APIBaseModel {

    public var buildParams: String?

    public var createdAt: String?

    public var pullRequestURL: String?

    public var slug: String?

    public init(buildParams: String? = nil, createdAt: String? = nil, pullRequestURL: String? = nil, slug: String? = nil) {
        self.buildParams = buildParams
        self.createdAt = createdAt
        self.pullRequestURL = pullRequestURL
        self.slug = slug
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        buildParams = try container.decodeIfPresent("build_params")
        createdAt = try container.decodeIfPresent("created_at")
        pullRequestURL = try container.decodeIfPresent("pull_request_url")
        slug = try container.decodeIfPresent("slug")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(buildParams, forKey: "build_params")
        try container.encodeIfPresent(createdAt, forKey: "created_at")
        try container.encodeIfPresent(pullRequestURL, forKey: "pull_request_url")
        try container.encodeIfPresent(slug, forKey: "slug")
    }

}
