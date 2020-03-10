//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct FindAvatarCandidateResponse: APIModel {

    public var data: [FindAvatarCandidateResponseItem]?

    public init(data: [FindAvatarCandidateResponseItem]? = nil) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        data = try container.decodeArrayIfPresent("data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(data, forKey: "data")
    }

}
