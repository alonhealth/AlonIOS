// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AlonIOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AlonIOS",
            targets: ["AlonIOS"]),
    ],
    dependencies: [
        // No external dependencies needed
    ],
    targets: [
        .target(
            name: "AlonIOS",
            dependencies: []),
        .testTarget(
            name: "AlonIOSTests",
            dependencies: ["AlonIOS"]),
    ]
)