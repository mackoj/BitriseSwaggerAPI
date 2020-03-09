//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct AppConfigRequestParam: APIModel {

    public var appConfigDatastoreYaml: String?

    public init(appConfigDatastoreYaml: String? = nil) {
        self.appConfigDatastoreYaml = appConfigDatastoreYaml
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        appConfigDatastoreYaml = try container.decodeIfPresent("app_config_datastore_yaml")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(appConfigDatastoreYaml, forKey: "app_config_datastore_yaml")
    }

}
