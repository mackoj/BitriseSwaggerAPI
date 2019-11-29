//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct ProvisionProfileResponseItemModel: APIBaseModel {

    public var downloadURL: String?

    public var isExpose: Bool?

    public var isProtected: Bool?

    public var processed: Bool?

    public var slug: String?

    public var uploadFileName: String?

    public var uploadFileSize: Int?

    public var uploadURL: String?

    public init(downloadURL: String? = nil, isExpose: Bool? = nil, isProtected: Bool? = nil, processed: Bool? = nil, slug: String? = nil, uploadFileName: String? = nil, uploadFileSize: Int? = nil, uploadURL: String? = nil) {
        self.downloadURL = downloadURL
        self.isExpose = isExpose
        self.isProtected = isProtected
        self.processed = processed
        self.slug = slug
        self.uploadFileName = uploadFileName
        self.uploadFileSize = uploadFileSize
        self.uploadURL = uploadURL
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        downloadURL = try container.decodeIfPresent("download_url")
        isExpose = try container.decodeIfPresent("is_expose")
        isProtected = try container.decodeIfPresent("is_protected")
        processed = try container.decodeIfPresent("processed")
        slug = try container.decodeIfPresent("slug")
        uploadFileName = try container.decodeIfPresent("upload_file_name")
        uploadFileSize = try container.decodeIfPresent("upload_file_size")
        uploadURL = try container.decodeIfPresent("upload_url")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(downloadURL, forKey: "download_url")
        try container.encodeIfPresent(isExpose, forKey: "is_expose")
        try container.encodeIfPresent(isProtected, forKey: "is_protected")
        try container.encodeIfPresent(processed, forKey: "processed")
        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(uploadFileName, forKey: "upload_file_name")
        try container.encodeIfPresent(uploadFileSize, forKey: "upload_file_size")
        try container.encodeIfPresent(uploadURL, forKey: "upload_url")
    }

}
