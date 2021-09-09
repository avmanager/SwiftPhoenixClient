// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let package = Package(
    name: "SwiftPhoenixClient",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "SwiftPhoenixClient", targets: ["SwiftPhoenixClient"]),
        .library(name: "StarscreamSwiftPhoenixClient", targets: ["StarscreamSwiftPhoenixClient"]),
        .library(name: "RxSwiftPhoenixClient", targets: ["RxSwiftPhoenixClient"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/daltoniam/Starscream.git", .upToNextMinor(from: "3.1.0")),
        .package(name: "Nimble", url: "https://github.com/Quick/Nimble.git", from: "9.0.0"),
        .package(name: "Quick", url: "https://github.com/Quick/Quick.git", from: "4.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "SwiftPhoenixClient", dependencies: []),
        .target(name: "StarscreamSwiftPhoenixClient", dependencies: ["SwiftPhoenixClient", "Starscream"]),
        .target(name: "RxSwiftPhoenixClient", dependencies: ["SwiftPhoenixClient", "RxSwift"]),
        .target(
            name: "TestSupport",
            dependencies: [
                "SwiftPhoenixClient",
                "Nimble",
                "Quick"
            ]
        ),
        .testTarget(
            name: "RxSwiftPhoenixClientTests",
            dependencies: [
                "RxSwiftPhoenixClient",
                "TestSupport",
                "Nimble",
                "Quick",
            ]
        ),
        .testTarget(
            name: "SwiftPhoenixClientTests",
            dependencies: [
                "SwiftPhoenixClient",
                "TestSupport",
                "Nimble",
                "Quick",
            ]),
    ]
)
