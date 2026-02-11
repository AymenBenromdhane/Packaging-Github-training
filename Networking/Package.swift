// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]
        ),
    ],
    dependencies: [
        .package(path: "../Entities")
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: ["Entities"],
            path: "Sources/Networking"
        ),
        .testTarget(
            name: "NetworkingTests",
            dependencies: ["Networking", "Entities"],
            path: "Tests/NetworkingTests"
        ),
    ]
)
