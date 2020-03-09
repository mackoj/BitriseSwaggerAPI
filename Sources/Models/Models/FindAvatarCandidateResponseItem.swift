//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct FindAvatarCandidateResponseItem: APIBaseModel {

    public var downloadURL: String?

    public var filename: String?

    public var slug: String?

    public init(downloadURL: String? = nil, filename: String? = nil, slug: String? = nil) {
        self.downloadURL = downloadURL
        self.filename = filename
        self.slug = slug
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        downloadURL = try container.decodeIfPresent("download_url")
        filename = try container.decodeIfPresent("filename")
        slug = try container.decodeIfPresent("slug")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(downloadURL, forKey: "download_url")
        try container.encodeIfPresent(filename, forKey: "filename")
        try container.encodeIfPresent(slug, forKey: "slug")
    }

}
