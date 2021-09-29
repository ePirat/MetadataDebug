// swift-tools-version:4.0.0
import PackageDescription

let package = Package(
    name: "MetadataDebug",
    products: [
        .executable(name: "MetadataDebug", targets: ["MetadataDebug"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/Commander", from: "0.5.0"),
    ],
    targets: [
        .target(
            name: "MetadataDebug",
            dependencies: ["Commander"],
            path: "Sources"),
    ]
)
