//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation
import BitriseAPIModels
import BitriseAPISharedCode

extension BitriseAPI.Builds {

    /**
    List all builds of an app

    List all the builds of a specified Bitrise app. Set parameters to filter builds: for example, you can search for builds run with a given workflow or all builds that were triggered by Pull Requests. It returns all the relevant data of the build.
    */
    public enum BuildList {

        public static let service = APIService<Response>(id: "build-list", tag: "builds", method: "GET", path: "/apps/{app-slug}/builds", hasBody: false, securityRequirement: SecurityRequirement(type: "PersonalAccessToken", scopes: []))

        /** Order of builds: sort them based on when they were created or the time when they were triggered */
        public enum SortBy: String, Codable, Equatable, CaseIterable {
            case runningFirst = "running_first"
            case createdAt = "created_at"
        }

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** App slug */
                public var appSlug: String

                /** Order of builds: sort them based on when they were created or the time when they were triggered */
                public var sortBy: SortBy?

                /** The branch which was built */
                public var branch: String?

                /** The name of the workflow used for the build */
                public var workflow: String?

                /** The commit message of the build */
                public var commitMessage: String?

                /** The event that triggered the build (push, pull-request, tag) */
                public var triggerEventType: String?

                /** The id of the pull request that triggered the build */
                public var pullRequestId: Int?

                /** The build number */
                public var buildNumber: Int?

                /** List builds run after a given date (Unix Timestamp) */
                public var after: Int?

                /** List builds run before a given date (Unix Timestamp) */
                public var before: Int?

                /** The status of the build: not finished (0), successful (1), failed (2), aborted with failure (3), aborted with success (4) */
                public var status: Int?

                /** Slug of the first build in the response */
                public var next: String?

                /** Max number of elements per page (default: 50) */
                public var limit: Int?

                public init(appSlug: String, sortBy: SortBy? = nil, branch: String? = nil, workflow: String? = nil, commitMessage: String? = nil, triggerEventType: String? = nil, pullRequestId: Int? = nil, buildNumber: Int? = nil, after: Int? = nil, before: Int? = nil, status: Int? = nil, next: String? = nil, limit: Int? = nil) {
                    self.appSlug = appSlug
                    self.sortBy = sortBy
                    self.branch = branch
                    self.workflow = workflow
                    self.commitMessage = commitMessage
                    self.triggerEventType = triggerEventType
                    self.pullRequestId = pullRequestId
                    self.buildNumber = buildNumber
                    self.after = after
                    self.before = before
                    self.status = status
                    self.next = next
                    self.limit = limit
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: BuildList.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(appSlug: String, sortBy: SortBy? = nil, branch: String? = nil, workflow: String? = nil, commitMessage: String? = nil, triggerEventType: String? = nil, pullRequestId: Int? = nil, buildNumber: Int? = nil, after: Int? = nil, before: Int? = nil, status: Int? = nil, next: String? = nil, limit: Int? = nil) {
                let options = Options(appSlug: appSlug, sortBy: sortBy, branch: branch, workflow: workflow, commitMessage: commitMessage, triggerEventType: triggerEventType, pullRequestId: pullRequestId, buildNumber: buildNumber, after: after, before: before, status: status, next: next, limit: limit)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "app-slug" + "}", with: "\(self.options.appSlug)")
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                if let sortBy = options.sortBy?.encode() {
                  params["sort_by"] = sortBy
                }
                if let branch = options.branch {
                  params["branch"] = branch
                }
                if let workflow = options.workflow {
                  params["workflow"] = workflow
                }
                if let commitMessage = options.commitMessage {
                  params["commit_message"] = commitMessage
                }
                if let triggerEventType = options.triggerEventType {
                  params["trigger_event_type"] = triggerEventType
                }
                if let pullRequestId = options.pullRequestId {
                  params["pull_request_id"] = pullRequestId
                }
                if let buildNumber = options.buildNumber {
                  params["build_number"] = buildNumber
                }
                if let after = options.after {
                  params["after"] = after
                }
                if let before = options.before {
                  params["before"] = before
                }
                if let status = options.status {
                  params["status"] = status
                }
                if let next = options.next {
                  params["next"] = next
                }
                if let limit = options.limit {
                  params["limit"] = limit
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = BuildListResponseModel

            /** OK */
            case status200(BuildListResponseModel)

            /** Bad Request */
            case status400(ServiceStandardErrorRespModel)

            /** Unauthorized */
            case status401(ServiceStandardErrorRespModel)

            /** Not Found */
            case status404(ServiceStandardErrorRespModel)

            /** Internal Server Error */
            case status500(ServiceStandardErrorRespModel)

            public var success: BuildListResponseModel? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: ServiceStandardErrorRespModel? {
                switch self {
                case .status400(let response): return response
                case .status401(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<BuildListResponseModel, ServiceStandardErrorRespModel> {
                if let successValue = success {
                    return .success(successValue)
                } else if let failureValue = failure {
                    return .failure(failureValue)
                } else {
                    fatalError("Response does not have success or failure response")
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                case .status400(let response): return response
                case .status401(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status400: return 400
                case .status401: return 401
                case .status404: return 404
                case .status500: return 500
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                case .status401: return false
                case .status404: return false
                case .status500: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(BuildListResponseModel.self, from: data))
                case 400: self = try .status400(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
                case 401: self = try .status401(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
                case 404: self = try .status404(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
                case 500: self = try .status500(decoder.decode(ServiceStandardErrorRespModel.self, from: data))
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
