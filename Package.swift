// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "BitriseSwaggerAPI",
    products: [
        .library(name: "BitriseSwaggerAPI", targets: ["BitriseSwaggerAPIClient"]),
        .library(name: "BitriseSwaggerAPIDynamic", type: .dynamic, targets: ["BitriseSwaggerAPIClient"]),
        .library(name: "BitriseSwaggerAPIRequests", targets: ["BitriseSwaggerAPIRequests"]),
        .library(name: "BitriseSwaggerAPIDynamicRequests", type: .dynamic, targets: ["BitriseSwaggerAPIRequests"]),
        .library(name: "BitriseSwaggerAPIModels", targets: ["BitriseSwaggerAPIModels"]),
        .library(name: "BitriseSwaggerAPIDynamicModels", type: .dynamic, targets: ["BitriseSwaggerAPIModels"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .exact("4.9.0")),
    ],
    targets: [
        .target(name: "BitriseSwaggerAPISharedCode", path: "Sources/SharedCode"),
        .target(name: "BitriseSwaggerAPIModels", path: "Sources/Models"),
        .target(name: "BitriseSwaggerAPIRequests", dependencies: [ "BitriseSwaggerAPIModels", "BitriseSwaggerAPISharedCode"], path: "Sources/Requests"),
        .target(name: "BitriseSwaggerAPIClient", dependencies: [
          "BitriseSwaggerAPIRequests",
          "Alamofire",
        ], path: "Sources/Client")
    ]
)
