// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AWSAppSync",
    products: [
        .library(
            name: "AWSAppSync",
            targets: ["AWSAppSync"]),
    ],
    dependencies: [
        .package(
            name: "AWSiOSSDKV2",
            url: "https://github.com/aws-amplify/aws-sdk-ios-spm.git",
            .upToNextMajor(from: "2.27.0")
        ),
        .package(
            name: "AppSyncRealTimeClient",
            url: "https://github.com/majedoh/aws-appsync-realtime-client-ios.git",
            .branch("master")
        ),
        .package(
            url: "https://github.com/stephencelis/SQLite.swift.git",
            .branch("master")
        ),
        .package(
            name: "Reachability",
            url: "https://github.com/ashleymills/Reachability.swift.git",
            .branch("master")
        )
    ],
    targets: [
        .target(
            name: "AWSAppSync",
            dependencies: [
                .product(name: "SQLite", package: "SQLite.swift"),
                .product(name: "AppSyncRealTimeClient", package: "AppSyncRealTimeClient"),
                .product(name: "Reachability", package: "Reachability"),
                .product(name: "AWSCore", package: "AWSiOSSDKV2")
            ],
            path: "AWSAppSyncClient",
            exclude: [
                "Info.plist",
                "Apollo/Sources/Apollo/Info.plist"
            ]
        )
    ]
)
