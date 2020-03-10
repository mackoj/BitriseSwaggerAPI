//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct ArtifactResponseItemModel: APIModel {

    public var artifactMeta: String?

    public var artifactType: String?

    public var expiringDownloadURL: String?

    public var fileSizeBytes: Int?

    public var isPublicPageEnabled: Bool?

    public var publicInstallPageURL: String?

    public var slug: String?

    public var title: String?

    public init(artifactMeta: String? = nil, artifactType: String? = nil, expiringDownloadURL: String? = nil, fileSizeBytes: Int? = nil, isPublicPageEnabled: Bool? = nil, publicInstallPageURL: String? = nil, slug: String? = nil, title: String? = nil) {
        self.artifactMeta = artifactMeta
        self.artifactType = artifactType
        self.expiringDownloadURL = expiringDownloadURL
        self.fileSizeBytes = fileSizeBytes
        self.isPublicPageEnabled = isPublicPageEnabled
        self.publicInstallPageURL = publicInstallPageURL
        self.slug = slug
        self.title = title
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        artifactMeta = try container.decodeIfPresent("artifact_meta")
        artifactType = try container.decodeIfPresent("artifact_type")
        expiringDownloadURL = try container.decodeIfPresent("expiring_download_url")
        fileSizeBytes = try container.decodeIfPresent("file_size_bytes")
        isPublicPageEnabled = try container.decodeIfPresent("is_public_page_enabled")
        publicInstallPageURL = try container.decodeIfPresent("public_install_page_url")
        slug = try container.decodeIfPresent("slug")
        title = try container.decodeIfPresent("title")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(artifactMeta, forKey: "artifact_meta")
        try container.encodeIfPresent(artifactType, forKey: "artifact_type")
        try container.encodeIfPresent(expiringDownloadURL, forKey: "expiring_download_url")
        try container.encodeIfPresent(fileSizeBytes, forKey: "file_size_bytes")
        try container.encodeIfPresent(isPublicPageEnabled, forKey: "is_public_page_enabled")
        try container.encodeIfPresent(publicInstallPageURL, forKey: "public_install_page_url")
        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(title, forKey: "title")
    }

}
