// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Pantomime",
    platforms: [.macOS(.v12), .iOS(.v16)],
    products: [
        .library(
            name: "Pantomime",
            targets: ["Pantomime"])
    ],
    targets: [
        .target(name: "Pantomime")
    ]
)
