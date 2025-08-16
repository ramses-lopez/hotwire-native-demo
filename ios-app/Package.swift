// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "HotwireApp",
    platforms: [
        .iOS(.v15)
    ],
    dependencies: [
        .package(url: "https://github.com/hotwired/turbo-ios", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "HotwireApp",
            dependencies: [
                .product(name: "Turbo", package: "turbo-ios")
            ]
        )
    ]
)