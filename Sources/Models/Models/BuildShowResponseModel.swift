//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildShowResponseModel: APIBaseModel {

    public var data: BuildResponseItemModel?

    public init(data: BuildResponseItemModel? = nil) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        data = try container.decodeIfPresent("data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(data, forKey: "data")
    }

}
