// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TestPermissionIos",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "TestPermissionIos",
            targets: ["testPermissionIosPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "testPermissionIosPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/testPermissionIosPlugin"),
        .testTarget(
            name: "testPermissionIosPluginTests",
            dependencies: ["testPermissionIosPlugin"],
            path: "ios/Tests/testPermissionIosPluginTests")
    ]
)
