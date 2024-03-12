// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "TestCLI",
    products: [
        .executable(
            name: "TestCLI",
            targets: ["TestCLI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.3.0")),
    ],
    targets: [
        .executableTarget(
            name: "TestCLI",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .testTarget(
            name: "TestCLITests",
            dependencies: ["TestCLI"]
        )
    ]
)
