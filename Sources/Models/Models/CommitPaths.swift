//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct CommitPaths: APIModel {

    public var added: [String]?

    public var modified: [String]?

    public var removed: [String]?

    public init(added: [String]? = nil, modified: [String]? = nil, removed: [String]? = nil) {
        self.added = added
        self.modified = modified
        self.removed = removed
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        added = try container.decodeArrayIfPresent("added")
        modified = try container.decodeArrayIfPresent("modified")
        removed = try container.decodeArrayIfPresent("removed")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(added, forKey: "added")
        try container.encodeIfPresent(modified, forKey: "modified")
        try container.encodeIfPresent(removed, forKey: "removed")
    }

}
