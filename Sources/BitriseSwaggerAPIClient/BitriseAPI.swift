//
// HawkCI
// BitriseAPIClien
// 2019
//

import Foundation
import BitriseSwaggerAPI

extension Date {
    func encode() -> Any {
        return BitriseAPI.dateEncodingFormatter.string(from: self)
    }
}

/** Official REST API for Bitrise.io */
public struct BitriseAPI {

    /// Whether to discard any errors when decoding optional properties
    public static var safeOptionalDecoding = true

    /// Whether to remove invalid elements instead of throwing when decoding arrays
    public static var safeArrayDecoding = true

//    /// Used to encode Dates when uses as string params
  public static var dateEncodingFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        formatter.calendar = .current
        return formatter
    }()

    public static let version = "0.1"

    public enum Activity {}
    public enum Addons {}
    public enum AndroidKeystoreFile {}
    public enum AppSetup {}
    public enum Application {}
    public enum AvatarCandidate {}
    public enum BuildArtifact {}
    public enum BuildCertificate {}
    public enum BuildRequest {}
    public enum Builds {}
    public enum GenericProjectFile {}
    public enum Organizations {}
    public enum OutgoingWebhook {}
    public enum ProvisioningProfile {}
    public enum TestDevices {}
    public enum User {}
    public enum WebhookDeliveryItem {}

    public enum Server {

        public static let main = "https://api.bitrise.io/v0.1"
    }
}
