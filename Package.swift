// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BitriseSwaggerAPIClient",
  products: [
    .library(name: "BitriseSwaggerAPI", targets: ["BitriseSwaggerAPI"]),
    .library(name: "BitriseSwaggerAPIClient", targets: ["BitriseSwaggerAPIClient"]),
  ],
  dependencies: [
    .package(url: "https://github.com/Flight-School/AnyCodable.git", from: "0.2.3"),
    .package(url: "https://github.com/Alamofire/Alamofire.git", .exact("4.9.0")),
    .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.0.1"),
  ],
  targets: [
    .target(name: "BitriseSwaggerAPI", dependencies: ["AnyCodable"]),
    .target(
      name: "BitriseSwaggerAPIClient",
      dependencies: ["BitriseSwaggerAPI", "Alamofire"]),
    .testTarget(
      name: "BitriseSwaggerAPIClientTests",
      dependencies: ["BitriseSwaggerAPIClient"]),
  ]
)
