// swift-tools-version:4.0.0
import PackageDescription

let package = Package(
    name: "MetadataDebug",
    products: [
        .executable(name: "MetadataDebug", targets: ["MetadataDebug"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "MetadataDebug",
            dependencies: ["ArgumentParser"],
            path: "Sources"),
    ]
)
