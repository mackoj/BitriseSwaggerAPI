//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AppAddOnResponseItemModel: APIBaseModel {

    public var description: String?

    public var documentationURL: String?

    public var hasUi: Bool?

    public var icon: String?

    public var id: String?

    public var isBeta: Bool?

    public var plan: AddonsPlan?

    public var setupGuide: AddonsSetupGuide?

    public var summary: String?

    public var title: String?

    public init(description: String? = nil, documentationURL: String? = nil, hasUi: Bool? = nil, icon: String? = nil, id: String? = nil, isBeta: Bool? = nil, plan: AddonsPlan? = nil, setupGuide: AddonsSetupGuide? = nil, summary: String? = nil, title: String? = nil) {
        self.description = description
        self.documentationURL = documentationURL
        self.hasUi = hasUi
        self.icon = icon
        self.id = id
        self.isBeta = isBeta
        self.plan = plan
        self.setupGuide = setupGuide
        self.summary = summary
        self.title = title
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        description = try container.decodeIfPresent("description")
        documentationURL = try container.decodeIfPresent("documentation_url")
        hasUi = try container.decodeIfPresent("has_ui")
        icon = try container.decodeIfPresent("icon")
        id = try container.decodeIfPresent("id")
        isBeta = try container.decodeIfPresent("is_beta")
        plan = try container.decodeIfPresent("plan")
        setupGuide = try container.decodeIfPresent("setup_guide")
        summary = try container.decodeIfPresent("summary")
        title = try container.decodeIfPresent("title")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(documentationURL, forKey: "documentation_url")
        try container.encodeIfPresent(hasUi, forKey: "has_ui")
        try container.encodeIfPresent(icon, forKey: "icon")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(isBeta, forKey: "is_beta")
        try container.encodeIfPresent(plan, forKey: "plan")
        try container.encodeIfPresent(setupGuide, forKey: "setup_guide")
        try container.encodeIfPresent(summary, forKey: "summary")
        try container.encodeIfPresent(title, forKey: "title")
    }

}
