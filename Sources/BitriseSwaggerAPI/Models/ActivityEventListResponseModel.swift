//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct ActivityEventListResponseModel: APIBaseModel {

    public var data: [ActivityEventResponseItemModel]?

    public var paging: PagingResponseModel?

    public init(data: [ActivityEventResponseItemModel]? = nil, paging: PagingResponseModel? = nil) {
        self.data = data
        self.paging = paging
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        data = try container.decodeArrayIfPresent("data")
        paging = try container.decodeIfPresent("paging")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(data, forKey: "data")
        try container.encodeIfPresent(paging, forKey: "paging")
    }

}
