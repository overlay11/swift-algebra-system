// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SwiftAlgebraSystem",
    targets: [
        .target(name: "SwiftAlgebraSystem"),
        .testTarget(
            name: "SwiftAlgebraSystemTests",
            dependencies: ["SwiftAlgebraSystem"]
        ),
    ]
)
