//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct OwnerAddOnResponseItemModel: APIBaseModel {

    public var apps: [AddOnAppResponseItemModel]?

    public var documentationURL: String?

    public var hasUi: Bool?

    public var icon: String?

    public var id: String?

    public var isBeta: Bool?

    public var summary: String?

    public var title: String?

    public init(apps: [AddOnAppResponseItemModel]? = nil, documentationURL: String? = nil, hasUi: Bool? = nil, icon: String? = nil, id: String? = nil, isBeta: Bool? = nil, summary: String? = nil, title: String? = nil) {
        self.apps = apps
        self.documentationURL = documentationURL
        self.hasUi = hasUi
        self.icon = icon
        self.id = id
        self.isBeta = isBeta
        self.summary = summary
        self.title = title
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        apps = try container.decodeArrayIfPresent("apps")
        documentationURL = try container.decodeIfPresent("documentation_url")
        hasUi = try container.decodeIfPresent("has_ui")
        icon = try container.decodeIfPresent("icon")
        id = try container.decodeIfPresent("id")
        isBeta = try container.decodeIfPresent("is_beta")
        summary = try container.decodeIfPresent("summary")
        title = try container.decodeIfPresent("title")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(apps, forKey: "apps")
        try container.encodeIfPresent(documentationURL, forKey: "documentation_url")
        try container.encodeIfPresent(hasUi, forKey: "has_ui")
        try container.encodeIfPresent(icon, forKey: "icon")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(isBeta, forKey: "is_beta")
        try container.encodeIfPresent(summary, forKey: "summary")
        try container.encodeIfPresent(title, forKey: "title")
    }

}
