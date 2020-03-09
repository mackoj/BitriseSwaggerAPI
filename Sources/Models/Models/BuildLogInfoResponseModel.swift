//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildLogInfoResponseModel: APIModel {

    public var expiringRawLogURL: String?

    public var generatedLogChunksNum: Int?

    public var isArchived: Bool?

    public var logChunks: [BuildLogChunkItemResponseModel]?

    public var timestamp: String?

    public init(expiringRawLogURL: String? = nil, generatedLogChunksNum: Int? = nil, isArchived: Bool? = nil, logChunks: [BuildLogChunkItemResponseModel]? = nil, timestamp: String? = nil) {
        self.expiringRawLogURL = expiringRawLogURL
        self.generatedLogChunksNum = generatedLogChunksNum
        self.isArchived = isArchived
        self.logChunks = logChunks
        self.timestamp = timestamp
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        expiringRawLogURL = try container.decodeIfPresent("expiring_raw_log_url")
        generatedLogChunksNum = try container.decodeIfPresent("generated_log_chunks_num")
        isArchived = try container.decodeIfPresent("is_archived")
        logChunks = try container.decodeArrayIfPresent("log_chunks")
        timestamp = try container.decodeIfPresent("timestamp")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(expiringRawLogURL, forKey: "expiring_raw_log_url")
        try container.encodeIfPresent(generatedLogChunksNum, forKey: "generated_log_chunks_num")
        try container.encodeIfPresent(isArchived, forKey: "is_archived")
        try container.encodeIfPresent(logChunks, forKey: "log_chunks")
        try container.encodeIfPresent(timestamp, forKey: "timestamp")
    }

}
