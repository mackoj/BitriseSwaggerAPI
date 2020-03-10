//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AvatarCandidateCreateParams: APIModel {

    public var filename: String?

    public var filesize: Int?

    public init(filename: String? = nil, filesize: Int? = nil) {
        self.filename = filename
        self.filesize = filesize
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        filename = try container.decodeIfPresent("filename")
        filesize = try container.decodeIfPresent("filesize")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(filename, forKey: "filename")
        try container.encodeIfPresent(filesize, forKey: "filesize")
    }

}
