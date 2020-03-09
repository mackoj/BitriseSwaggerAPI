//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct ProjectFileStorageDocumentUpdateParams: APIModel {

    public var exposedMetaDatastore: String?

    public var isExpose: Bool?

    public var isProtected: Bool?

    public var processed: Bool?

    public var userEnvKey: String?

    public init(exposedMetaDatastore: String? = nil, isExpose: Bool? = nil, isProtected: Bool? = nil, processed: Bool? = nil, userEnvKey: String? = nil) {
        self.exposedMetaDatastore = exposedMetaDatastore
        self.isExpose = isExpose
        self.isProtected = isProtected
        self.processed = processed
        self.userEnvKey = userEnvKey
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        exposedMetaDatastore = try container.decodeIfPresent("exposed_meta_datastore")
        isExpose = try container.decodeIfPresent("is_expose")
        isProtected = try container.decodeIfPresent("is_protected")
        processed = try container.decodeIfPresent("processed")
        userEnvKey = try container.decodeIfPresent("user_env_key")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(exposedMetaDatastore, forKey: "exposed_meta_datastore")
        try container.encodeIfPresent(isExpose, forKey: "is_expose")
        try container.encodeIfPresent(isProtected, forKey: "is_protected")
        try container.encodeIfPresent(processed, forKey: "processed")
        try container.encodeIfPresent(userEnvKey, forKey: "user_env_key")
    }

}
