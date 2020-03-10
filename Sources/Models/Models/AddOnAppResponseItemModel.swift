//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AddOnAppResponseItemModel: APIModel {

    public var icon: String?

    public var plan: AddonsPlan?

    public var planStartedAt: String?

    public var slug: String?

    public var title: String?

    public init(icon: String? = nil, plan: AddonsPlan? = nil, planStartedAt: String? = nil, slug: String? = nil, title: String? = nil) {
        self.icon = icon
        self.plan = plan
        self.planStartedAt = planStartedAt
        self.slug = slug
        self.title = title
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        icon = try container.decodeIfPresent("icon")
        plan = try container.decodeIfPresent("plan")
        planStartedAt = try container.decodeIfPresent("plan_started_at")
        slug = try container.decodeIfPresent("slug")
        title = try container.decodeIfPresent("title")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(icon, forKey: "icon")
        try container.encodeIfPresent(plan, forKey: "plan")
        try container.encodeIfPresent(planStartedAt, forKey: "plan_started_at")
        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(title, forKey: "title")
    }

}
