// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "UrbanExplorer",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [.library(name: "UrbanExplorer", targets: ["UrbanExplorer"])],
    targets: [
        .target(name: "UrbanExplorer", resources: [.copy("Resources/spots.json")]),
        .testTarget(name: "UrbanExplorerTests", dependencies: ["UrbanExplorer"]),
    ]
)
