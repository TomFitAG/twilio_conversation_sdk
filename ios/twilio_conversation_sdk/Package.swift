// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "twilio_conversation_sdk",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "twilio-conversation-sdk", targets: ["twilio_conversation_sdk"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        // Twilio's official SPM distribution of the Conversations client. Version
        // constraint mirrors the podspec's `~> 4.0` (>= 4.0.8 to pick up the fix for
        // the updateToken/shutdown race in TwilsockLib, < 5.0).
        .package(url: "https://github.com/twilio/conversations-ios", .upToNextMajor(from: "4.0.8"))
    ],
    targets: [
        .target(
            name: "twilio_conversation_sdk",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "TwilioConversationsClient", package: "conversations-ios")
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
