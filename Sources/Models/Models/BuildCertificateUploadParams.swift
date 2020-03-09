//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildCertificateUploadParams: APIBaseModel {

    public var uploadFileName: String?

    public var uploadFileSize: Int?

    public init(uploadFileName: String? = nil, uploadFileSize: Int? = nil) {
        self.uploadFileName = uploadFileName
        self.uploadFileSize = uploadFileSize
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        uploadFileName = try container.decodeIfPresent("upload_file_name")
        uploadFileSize = try container.decodeIfPresent("upload_file_size")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(uploadFileName, forKey: "upload_file_name")
        try container.encodeIfPresent(uploadFileSize, forKey: "upload_file_size")
    }

}
