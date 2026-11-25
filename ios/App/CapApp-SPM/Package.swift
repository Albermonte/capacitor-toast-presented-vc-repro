// swift-tools-version: 5.9
import PackageDescription

// DO NOT MODIFY THIS FILE - managed by Capacitor CLI commands
let package = Package(
    name: "CapApp-SPM",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "CapApp-SPM",
            targets: ["CapApp-SPM"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", exact: "8.6.2"),
        .package(name: "CapacitorBrowser", path: "../../../node_modules/.pnpm/@capacitor+browser@8.0.5_@capacitor+core@8.6.2/node_modules/@capacitor/browser"),
        .package(name: "CapacitorToast", path: "../../../node_modules/.pnpm/@capacitor+toast@8.0.1_patch_hash=15b79a7c320fe6453127769a89fff6c1df948400f2f96e0401010444b5228b5f_@capacitor+core@8.6.2/node_modules/@capacitor/toast")
    ],
    targets: [
        .target(
            name: "CapApp-SPM",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm"),
                .product(name: "CapacitorBrowser", package: "CapacitorBrowser"),
                .product(name: "CapacitorToast", package: "CapacitorToast")
            ]
        )
    ]
)
