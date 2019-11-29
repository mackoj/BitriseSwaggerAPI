//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct ActivityEventResponseItemModel: APIBaseModel {

    public var createdAt: String?

    public var description: String?

    public var eventIcon: String?

    public var eventStype: String?

    public var repositoryAvatarIconURL: String?

    public var repositoryTitle: String?

    public var slug: String?

    public var targetPathString: String?

    public var title: String?

    public init(createdAt: String? = nil, description: String? = nil, eventIcon: String? = nil, eventStype: String? = nil, repositoryAvatarIconURL: String? = nil, repositoryTitle: String? = nil, slug: String? = nil, targetPathString: String? = nil, title: String? = nil) {
        self.createdAt = createdAt
        self.description = description
        self.eventIcon = eventIcon
        self.eventStype = eventStype
        self.repositoryAvatarIconURL = repositoryAvatarIconURL
        self.repositoryTitle = repositoryTitle
        self.slug = slug
        self.targetPathString = targetPathString
        self.title = title
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        createdAt = try container.decodeIfPresent("created_at")
        description = try container.decodeIfPresent("description")
        eventIcon = try container.decodeIfPresent("event_icon")
        eventStype = try container.decodeIfPresent("event_stype")
        repositoryAvatarIconURL = try container.decodeIfPresent("repository_avatar_icon_url")
        repositoryTitle = try container.decodeIfPresent("repository_title")
        slug = try container.decodeIfPresent("slug")
        targetPathString = try container.decodeIfPresent("target_path_string")
        title = try container.decodeIfPresent("title")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(createdAt, forKey: "created_at")
        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(eventIcon, forKey: "event_icon")
        try container.encodeIfPresent(eventStype, forKey: "event_stype")
        try container.encodeIfPresent(repositoryAvatarIconURL, forKey: "repository_avatar_icon_url")
        try container.encodeIfPresent(repositoryTitle, forKey: "repository_title")
        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(targetPathString, forKey: "target_path_string")
        try container.encodeIfPresent(title, forKey: "title")
    }

}
