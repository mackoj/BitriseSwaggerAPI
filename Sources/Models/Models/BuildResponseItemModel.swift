//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct BuildResponseItemModel: APIModel {

    public var abortReason: String?

    public var branch: String?

    public var buildNumber: Int?

    public var commitHash: String?

    public var commitMessage: String?

    public var commitViewURL: String?

    public var environmentPrepareFinishedAt: String?

    public var finishedAt: String?

    public var isOnHold: Bool?

    public var machineTypeId: String?

    public var originalBuildParams: String?

    public var pullRequestId: Int?

    public var pullRequestTargetBranch: String?

    public var pullRequestViewURL: String?

    public var slug: String?

    public var stackConfigType: String?

    public var stackIdentifier: String?

    public var startedOnWorkerAt: String?

    public var status: Int?

    public var statusText: String?

    public var tag: String?

    public var triggeredAt: String?

    public var triggeredBy: String?

    public var triggeredWorkflow: String?

    public init(abortReason: String? = nil, branch: String? = nil, buildNumber: Int? = nil, commitHash: String? = nil, commitMessage: String? = nil, commitViewURL: String? = nil, environmentPrepareFinishedAt: String? = nil, finishedAt: String? = nil, isOnHold: Bool? = nil, machineTypeId: String? = nil, originalBuildParams: String? = nil, pullRequestId: Int? = nil, pullRequestTargetBranch: String? = nil, pullRequestViewURL: String? = nil, slug: String? = nil, stackConfigType: String? = nil, stackIdentifier: String? = nil, startedOnWorkerAt: String? = nil, status: Int? = nil, statusText: String? = nil, tag: String? = nil, triggeredAt: String? = nil, triggeredBy: String? = nil, triggeredWorkflow: String? = nil) {
        self.abortReason = abortReason
        self.branch = branch
        self.buildNumber = buildNumber
        self.commitHash = commitHash
        self.commitMessage = commitMessage
        self.commitViewURL = commitViewURL
        self.environmentPrepareFinishedAt = environmentPrepareFinishedAt
        self.finishedAt = finishedAt
        self.isOnHold = isOnHold
        self.machineTypeId = machineTypeId
        self.originalBuildParams = originalBuildParams
        self.pullRequestId = pullRequestId
        self.pullRequestTargetBranch = pullRequestTargetBranch
        self.pullRequestViewURL = pullRequestViewURL
        self.slug = slug
        self.stackConfigType = stackConfigType
        self.stackIdentifier = stackIdentifier
        self.startedOnWorkerAt = startedOnWorkerAt
        self.status = status
        self.statusText = statusText
        self.tag = tag
        self.triggeredAt = triggeredAt
        self.triggeredBy = triggeredBy
        self.triggeredWorkflow = triggeredWorkflow
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        abortReason = try container.decodeIfPresent("abort_reason")
        branch = try container.decodeIfPresent("branch")
        buildNumber = try container.decodeIfPresent("build_number")
        commitHash = try container.decodeIfPresent("commit_hash")
        commitMessage = try container.decodeIfPresent("commit_message")
        commitViewURL = try container.decodeIfPresent("commit_view_url")
        environmentPrepareFinishedAt = try container.decodeIfPresent("environment_prepare_finished_at")
        finishedAt = try container.decodeIfPresent("finished_at")
        isOnHold = try container.decodeIfPresent("is_on_hold")
        machineTypeId = try container.decodeIfPresent("machine_type_id")
        originalBuildParams = try container.decodeIfPresent("original_build_params")
        pullRequestId = try container.decodeIfPresent("pull_request_id")
        pullRequestTargetBranch = try container.decodeIfPresent("pull_request_target_branch")
        pullRequestViewURL = try container.decodeIfPresent("pull_request_view_url")
        slug = try container.decodeIfPresent("slug")
        stackConfigType = try container.decodeIfPresent("stack_config_type")
        stackIdentifier = try container.decodeIfPresent("stack_identifier")
        startedOnWorkerAt = try container.decodeIfPresent("started_on_worker_at")
        status = try container.decodeIfPresent("status")
        statusText = try container.decodeIfPresent("status_text")
        tag = try container.decodeIfPresent("tag")
        triggeredAt = try container.decodeIfPresent("triggered_at")
        triggeredBy = try container.decodeIfPresent("triggered_by")
        triggeredWorkflow = try container.decodeIfPresent("triggered_workflow")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(abortReason, forKey: "abort_reason")
        try container.encodeIfPresent(branch, forKey: "branch")
        try container.encodeIfPresent(buildNumber, forKey: "build_number")
        try container.encodeIfPresent(commitHash, forKey: "commit_hash")
        try container.encodeIfPresent(commitMessage, forKey: "commit_message")
        try container.encodeIfPresent(commitViewURL, forKey: "commit_view_url")
        try container.encodeIfPresent(environmentPrepareFinishedAt, forKey: "environment_prepare_finished_at")
        try container.encodeIfPresent(finishedAt, forKey: "finished_at")
        try container.encodeIfPresent(isOnHold, forKey: "is_on_hold")
        try container.encodeIfPresent(machineTypeId, forKey: "machine_type_id")
        try container.encodeIfPresent(originalBuildParams, forKey: "original_build_params")
        try container.encodeIfPresent(pullRequestId, forKey: "pull_request_id")
        try container.encodeIfPresent(pullRequestTargetBranch, forKey: "pull_request_target_branch")
        try container.encodeIfPresent(pullRequestViewURL, forKey: "pull_request_view_url")
        try container.encodeIfPresent(slug, forKey: "slug")
        try container.encodeIfPresent(stackConfigType, forKey: "stack_config_type")
        try container.encodeIfPresent(stackIdentifier, forKey: "stack_identifier")
        try container.encodeIfPresent(startedOnWorkerAt, forKey: "started_on_worker_at")
        try container.encodeIfPresent(status, forKey: "status")
        try container.encodeIfPresent(statusText, forKey: "status_text")
        try container.encodeIfPresent(tag, forKey: "tag")
        try container.encodeIfPresent(triggeredAt, forKey: "triggered_at")
        try container.encodeIfPresent(triggeredBy, forKey: "triggered_by")
        try container.encodeIfPresent(triggeredWorkflow, forKey: "triggered_workflow")
    }

}
