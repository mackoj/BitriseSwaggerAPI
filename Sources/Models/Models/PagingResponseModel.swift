//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct PagingResponseModel: APIModel {

    /** Next is the "anchor" for pagination. This value should be passed to the same endpoint
to get the next page. Empty/not included if there's no "next" page.
Stop paging when there's no "Next" item in the response! */
    public var next: String?

    /** PageItemLimit - per-page item count. A given page might include
less items if there's not enough items. This value is the "max item count per page". */
    public var pageItemLimit: Int?

    /** TotalItemCount - total item count, through "all pages" */
    public var totalItemCount: Int?

    public init(next: String? = nil, pageItemLimit: Int? = nil, totalItemCount: Int? = nil) {
        self.next = next
        self.pageItemLimit = pageItemLimit
        self.totalItemCount = totalItemCount
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        next = try container.decodeIfPresent("next")
        pageItemLimit = try container.decodeIfPresent("page_item_limit")
        totalItemCount = try container.decodeIfPresent("total_item_count")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(next, forKey: "next")
        try container.encodeIfPresent(pageItemLimit, forKey: "page_item_limit")
        try container.encodeIfPresent(totalItemCount, forKey: "total_item_count")
    }

}
