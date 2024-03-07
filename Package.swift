// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CLITest",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "CLITest",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            path: "Sources"
        ),
    ]
)
