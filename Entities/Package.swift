// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Entities",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "Entities",
            targets: ["Entities"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Entities",
            dependencies: [],
            path: "Sources/Entities"
        ),
        .testTarget(
            name: "EntitiesTests",
            dependencies: ["Entities"],
            path: "Tests/EntitiesTests"
        ),
    ]
)
