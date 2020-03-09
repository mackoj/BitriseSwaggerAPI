//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation

public struct SSHKeyUploadParams: APIModel {

    /** The private part of the SSH key you would like to use */
    public var authSshPrivateKey: String?

    /** The public part of the SSH key you would like to use */
    public var authSshPublicKey: String?

    /** If it's set to true, the provided SSH key will be registered at the provider of the application */
    public var isRegisterKeyIntoProviderService: Bool?

    public init(authSshPrivateKey: String? = nil, authSshPublicKey: String? = nil, isRegisterKeyIntoProviderService: Bool? = nil) {
        self.authSshPrivateKey = authSshPrivateKey
        self.authSshPublicKey = authSshPublicKey
        self.isRegisterKeyIntoProviderService = isRegisterKeyIntoProviderService
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        authSshPrivateKey = try container.decodeIfPresent("auth_ssh_private_key")
        authSshPublicKey = try container.decodeIfPresent("auth_ssh_public_key")
        isRegisterKeyIntoProviderService = try container.decodeIfPresent("is_register_key_into_provider_service")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(authSshPrivateKey, forKey: "auth_ssh_private_key")
        try container.encodeIfPresent(authSshPublicKey, forKey: "auth_ssh_public_key")
        try container.encodeIfPresent(isRegisterKeyIntoProviderService, forKey: "is_register_key_into_provider_service")
    }

}
