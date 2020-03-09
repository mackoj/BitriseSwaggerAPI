//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct ArtifactListElementResponseModel: APIBaseModel {

    public var artifactMeta: String?

    public var artifactType: String?

    public var fileSizeBytes: Int?

    public var isPublicPageEnabled: Bool?

    public var slug: String?

    public var title: String?

    public init(artifactMeta: String? = nil, artifactType: String? = nil, fileSizeBytes: Int? = nil, isPublicPageEnabled: Bool? = nil, slug: String? = nil, title: String? = nil) {
        self.artifactMeta = artifactMeta
        self.artifactType = artifactType
        self.fileSizeBytes = fileSizeBytes
        self.isPublicPageEnabled = isPublicPageEnabled
        self.slug = slug
        self.title = title
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        artifactMeta = try container.decodeIfPresent("artifact_meta")
        artifactType = try container.decodeIfPresent("artifact_type")
        fileSizeBytes = try container.decodeIfPresent("file_size_bytes")
        isPublicPageEnabled = try container.decodeIfPresent("is_public_page_enabled")
        slug = try container.decodeIfPresent("slug")
        title = try container.decodeIfPresent("title")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(artifactMeta, forKey: "artifact_meta")
        try container.encodeIfPresent(artifactType, forKey: "artifact_type")
        try container.encodeIfPresent(fileSizeBytes, forKey: "file_size_bytes")
        try container.encodeIfPresent(isPublicPageEnabled, forKey: "is_public_page_enabled")
        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(title, forKey: "title")
    }

}
