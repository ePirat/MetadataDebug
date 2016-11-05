import PackageDescription

let package = Package(
    name: "MetadataDebug",
    dependencies: [
        .Package(url: "https://github.com/kylef/Commander", majorVersion: 0, minor: 5)
    ]
)
