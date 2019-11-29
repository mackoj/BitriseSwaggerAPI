//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AppUploadParams: APIBaseModel {

    /** The slug of the owner of the repository at the git provider */
    public var gitOwner: String?

    /** The slug of the repository at the git provider */
    public var gitRepoSlug: String?

    /** If `true` then the repository visibility setting will be public, in case of `false` it will be private */
    public var isPublic: Bool?

    /** The git provider you are using, it can be `github`, `bitbucket`, `gitlab`, `gitlab-self-hosted` or `custom` */
    public var provider: String?

    /** The URL of your repository */
    public var repoURL: String?

    /** It has to be provided by legacy reasons and has to have the `git` value */
    public var type: String?

    public init(gitOwner: String? = nil, gitRepoSlug: String? = nil, isPublic: Bool? = nil, provider: String? = nil, repoURL: String? = nil, type: String? = nil) {
        self.gitOwner = gitOwner
        self.gitRepoSlug = gitRepoSlug
        self.isPublic = isPublic
        self.provider = provider
        self.repoURL = repoURL
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        gitOwner = try container.decodeIfPresent("git_owner")
        gitRepoSlug = try container.decodeIfPresent("git_repo_slug")
        isPublic = try container.decodeIfPresent("is_public")
        provider = try container.decodeIfPresent("provider")
        repoURL = try container.decodeIfPresent("repo_url")
        type = try container.decodeIfPresent("type")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(gitOwner, forKey: "git_owner")
        try container.encodeIfPresent(gitRepoSlug, forKey: "git_repo_slug")
        try container.encodeIfPresent(isPublic, forKey: "is_public")
        try container.encodeIfPresent(provider, forKey: "provider")
        try container.encodeIfPresent(repoURL, forKey: "repo_url")
        try container.encodeIfPresent(type, forKey: "type")
    }

}
