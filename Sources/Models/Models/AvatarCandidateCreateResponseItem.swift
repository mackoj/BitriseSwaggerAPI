//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AvatarCandidateCreateResponseItem: APIBaseModel {

    public var filename: String?

    public var filesize: Int?

    public var slug: String?

    public var uploadURL: String?

    public init(filename: String? = nil, filesize: Int? = nil, slug: String? = nil, uploadURL: String? = nil) {
        self.filename = filename
        self.filesize = filesize
        self.slug = slug
        self.uploadURL = uploadURL
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        filename = try container.decodeIfPresent("filename")
        filesize = try container.decodeIfPresent("filesize")
        slug = try container.decodeIfPresent("slug")
        uploadURL = try container.decodeIfPresent("upload_url")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(filename, forKey: "filename")
        try container.encodeIfPresent(filesize, forKey: "filesize")
        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(uploadURL, forKey: "upload_url")
    }

}
