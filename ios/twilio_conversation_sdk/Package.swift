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
        // Twilio's official SPM distribution of the Conversations client. Floor is
        // 4.0.8 to pick up Twilio's fix for a race between updateToken and shutdown
        // in TwilsockLib.
        //
        // NOTE: this intentionally does NOT match the podspec's `~> 4.0` constraint.
        // Twilio stopped publishing TwilioConversationsClient to CocoaPods trunk
        // after 4.0.2, so 4.0.3-4.0.8+ only exist as GitHub/SPM releases - the SPM
        // path can require them, the CocoaPods path can't. Don't "fix" this by
        // re-syncing the two; that's what broke `pod install` in v0.4.3+tomfit.1.
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
