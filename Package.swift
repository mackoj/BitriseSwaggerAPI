// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "BitriseSwaggerAPI",
    products: [
        .library(name: "BitriseAPI", targets: ["BitriseAPIClient"]),
        .library(name: "BitriseAPIDynamic", type: .dynamic, targets: ["BitriseAPIClient"]),
        .library(name: "BitriseAPIRequests", targets: ["BitriseAPIRequests"]),
        .library(name: "BitriseAPIDynamicRequests", type: .dynamic, targets: ["BitriseAPIRequests"]),
        .library(name: "BitriseAPIModels", targets: ["BitriseAPIModels"]),
        .library(name: "BitriseAPIDynamicModels", type: .dynamic, targets: ["BitriseAPIModels"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .exact("4.9.0")),
    ],
    targets: [
        .target(name: "BitriseAPISharedCode", path: "Sources/SharedCode"),
        .target(name: "BitriseAPIModels", path: "Sources/Models"),
        .target(name: "BitriseAPIRequests", dependencies: [ "BitriseAPIModels", "BitriseAPISharedCode"], path: "Sources/Requests"),
        .target(name: "BitriseAPIClient", dependencies: [
          "BitriseAPIRequests",
          "Alamofire",
        ], path: "Sources/Client")
    ]
)
