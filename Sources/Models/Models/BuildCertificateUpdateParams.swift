//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildCertificateUpdateParams: APIModel {

    public var certificatePassword: String?

    public var isExpose: Bool?

    public var isProtected: Bool?

    public var processed: Bool?

    public init(certificatePassword: String? = nil, isExpose: Bool? = nil, isProtected: Bool? = nil, processed: Bool? = nil) {
        self.certificatePassword = certificatePassword
        self.isExpose = isExpose
        self.isProtected = isProtected
        self.processed = processed
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        certificatePassword = try container.decodeIfPresent("certificate_password")
        isExpose = try container.decodeIfPresent("is_expose")
        isProtected = try container.decodeIfPresent("is_protected")
        processed = try container.decodeIfPresent("processed")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(certificatePassword, forKey: "certificate_password")
        try container.encodeIfPresent(isExpose, forKey: "is_expose")
        try container.encodeIfPresent(isProtected, forKey: "is_protected")
        try container.encodeIfPresent(processed, forKey: "processed")
    }

}
