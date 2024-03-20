// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "TestCLI",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .executable(name: "TestCLI", targets: ["TestCLI"]),
        .plugin(name: "TestCLIPlugin", targets: ["TestCLIPlugin"])
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
        .plugin(
            name: "TestCLIPlugin",
            capability: .buildTool(),
            dependencies: [
                .target(name: "TestCLI")
            ]
        )
    ]
)
