//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildTriggerParamsBuildParams: APIBaseModel {

    public var branch: String?

    public var branchDest: String?

    public var branchDestRepoOwner: String?

    public var branchRepoOwner: String?

    public var buildRequestSlug: String?

    public var commitHash: String?

    public var commitMessage: String?

    public var commitPaths: [CommitPaths]?

    public var diffURL: String?

    public var environments: [BuildParamsEnvironment]?

    public var pullRequestAuthor: String?

    public var pullRequestHeadBranch: String?

    public var pullRequestId: [String: Any]?

    public var pullRequestMergeBranch: String?

    public var pullRequestRepositoryURL: String?

    public var skipGitStatusReport: Bool?

    public var tag: String?

    public var workflowId: String?

    public init(branch: String? = nil, branchDest: String? = nil, branchDestRepoOwner: String? = nil, branchRepoOwner: String? = nil, buildRequestSlug: String? = nil, commitHash: String? = nil, commitMessage: String? = nil, commitPaths: [CommitPaths]? = nil, diffURL: String? = nil, environments: [BuildParamsEnvironment]? = nil, pullRequestAuthor: String? = nil, pullRequestHeadBranch: String? = nil, pullRequestId: [String: Any]? = nil, pullRequestMergeBranch: String? = nil, pullRequestRepositoryURL: String? = nil, skipGitStatusReport: Bool? = nil, tag: String? = nil, workflowId: String? = nil) {
        self.branch = branch
        self.branchDest = branchDest
        self.branchDestRepoOwner = branchDestRepoOwner
        self.branchRepoOwner = branchRepoOwner
        self.buildRequestSlug = buildRequestSlug
        self.commitHash = commitHash
        self.commitMessage = commitMessage
        self.commitPaths = commitPaths
        self.diffURL = diffURL
        self.environments = environments
        self.pullRequestAuthor = pullRequestAuthor
        self.pullRequestHeadBranch = pullRequestHeadBranch
        self.pullRequestId = pullRequestId
        self.pullRequestMergeBranch = pullRequestMergeBranch
        self.pullRequestRepositoryURL = pullRequestRepositoryURL
        self.skipGitStatusReport = skipGitStatusReport
        self.tag = tag
        self.workflowId = workflowId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        branch = try container.decodeIfPresent("branch")
        branchDest = try container.decodeIfPresent("branch_dest")
        branchDestRepoOwner = try container.decodeIfPresent("branch_dest_repo_owner")
        branchRepoOwner = try container.decodeIfPresent("branch_repo_owner")
        buildRequestSlug = try container.decodeIfPresent("build_request_slug")
        commitHash = try container.decodeIfPresent("commit_hash")
        commitMessage = try container.decodeIfPresent("commit_message")
        commitPaths = try container.decodeArrayIfPresent("commit_paths")
        diffURL = try container.decodeIfPresent("diff_url")
        environments = try container.decodeArrayIfPresent("environments")
        pullRequestAuthor = try container.decodeIfPresent("pull_request_author")
        pullRequestHeadBranch = try container.decodeIfPresent("pull_request_head_branch")
        pullRequestId = try container.decodeAnyIfPresent("pull_request_id")
        pullRequestMergeBranch = try container.decodeIfPresent("pull_request_merge_branch")
        pullRequestRepositoryURL = try container.decodeIfPresent("pull_request_repository_url")
        skipGitStatusReport = try container.decodeIfPresent("skip_git_status_report")
        tag = try container.decodeIfPresent("tag")
        workflowId = try container.decodeIfPresent("workflow_id")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(branch, forKey: "branch")
        try container.encodeIfPresent(branchDest, forKey: "branch_dest")
        try container.encodeIfPresent(branchDestRepoOwner, forKey: "branch_dest_repo_owner")
        try container.encodeIfPresent(branchRepoOwner, forKey: "branch_repo_owner")
        try container.encodeIfPresent(buildRequestSlug, forKey: "build_request_slug")
        try container.encodeIfPresent(commitHash, forKey: "commit_hash")
        try container.encodeIfPresent(commitMessage, forKey: "commit_message")
        try container.encodeIfPresent(commitPaths, forKey: "commit_paths")
        try container.encodeIfPresent(diffURL, forKey: "diff_url")
        try container.encodeIfPresent(environments, forKey: "environments")
        try container.encodeIfPresent(pullRequestAuthor, forKey: "pull_request_author")
        try container.encodeIfPresent(pullRequestHeadBranch, forKey: "pull_request_head_branch")
        try container.encodeAnyIfPresent(pullRequestId, forKey: "pull_request_id")
        try container.encodeIfPresent(pullRequestMergeBranch, forKey: "pull_request_merge_branch")
        try container.encodeIfPresent(pullRequestRepositoryURL, forKey: "pull_request_repository_url")
        try container.encodeIfPresent(skipGitStatusReport, forKey: "skip_git_status_report")
        try container.encodeIfPresent(tag, forKey: "tag")
        try container.encodeIfPresent(workflowId, forKey: "workflow_id")
    }

}
