//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AvatarPromoteResponseItemModel: APIModel {

    public var isCandidate: Bool?

    public var slug: String?

    public var uploadFileName: String?

    public var uploadFileSize: Int?

    public init(isCandidate: Bool? = nil, slug: String? = nil, uploadFileName: String? = nil, uploadFileSize: Int? = nil) {
        self.isCandidate = isCandidate
        self.slug = slug
        self.uploadFileName = uploadFileName
        self.uploadFileSize = uploadFileSize
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        isCandidate = try container.decodeIfPresent("is_candidate")
        slug = try container.decodeIfPresent("slug")
        uploadFileName = try container.decodeIfPresent("upload_file_name")
        uploadFileSize = try container.decodeIfPresent("upload_file_size")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(isCandidate, forKey: "is_candidate")
        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(uploadFileName, forKey: "upload_file_name")
        try container.encodeIfPresent(uploadFileSize, forKey: "upload_file_size")
    }

}
