// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "BinaryExtensions",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(name: "BinaryExtensions", targets: ["BinaryExtensions"])
    ],
    targets: [
        .target(name: "BinaryExtensions"),
        .testTarget(name: "BinaryExtensionsTests", dependencies: ["BinaryExtensions"])
    ]
)
