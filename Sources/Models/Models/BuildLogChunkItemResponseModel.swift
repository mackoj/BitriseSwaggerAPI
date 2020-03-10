//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildLogChunkItemResponseModel: APIModel {

    public var chunk: String?

    public var position: Int?

    public init(chunk: String? = nil, position: Int? = nil) {
        self.chunk = chunk
        self.position = position
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        chunk = try container.decodeIfPresent("chunk")
        position = try container.decodeIfPresent("position")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(chunk, forKey: "chunk")
        try container.encodeIfPresent(position, forKey: "position")
    }

}
