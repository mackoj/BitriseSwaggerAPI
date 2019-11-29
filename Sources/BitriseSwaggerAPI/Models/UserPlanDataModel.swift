//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct UserPlanDataModel: APIBaseModel {

    public var currentPlan: PlanDataModel?

    public var pendingPlan: PlanDataModel?

    public var trialExpiresAt: String?

    public init(currentPlan: PlanDataModel? = nil, pendingPlan: PlanDataModel? = nil, trialExpiresAt: String? = nil) {
        self.currentPlan = currentPlan
        self.pendingPlan = pendingPlan
        self.trialExpiresAt = trialExpiresAt
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        currentPlan = try container.decodeIfPresent("current_plan")
        pendingPlan = try container.decodeIfPresent("pending_plan")
        trialExpiresAt = try container.decodeIfPresent("trial_expires_at")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(currentPlan, forKey: "current_plan")
        try container.encodeIfPresent(pendingPlan, forKey: "pending_plan")
        try container.encodeIfPresent(trialExpiresAt, forKey: "trial_expires_at")
    }

}
