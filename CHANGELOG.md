## 0.4.3+tomfit.2
Fixed a broken CocoaPods dependency introduced in v0.4.3+tomfit.1: adding Swift Package Manager
support bumped `ios/twilio_conversation_sdk.podspec`'s `TwilioConversationsClient` constraint from
`~> 4.0` to `>= 4.0.8, < 5.0` to "match" `Package.swift`, but Twilio never published
`TwilioConversationsClient` past 4.0.2 to CocoaPods trunk (4.0.3+ are GitHub/SPM-only releases). This
made `pod install` fail outright for any app still on CocoaPods. Reverted the podspec constraint to
`~> 4.0` (resolves to 4.0.2, the newest version CocoaPods actually has); left `Package.swift`'s
`.upToNextMajor(from: "4.0.8")` untouched, since the SPM path does have access to 4.0.8+. The two
manifests now intentionally target different version floors - see the comments in each file.

## 0.4.3+tomfit.1
Merged upstream 0.4.3 (iOS hanging-callback fixes, Android IllegalStateException guard) with the
TomFit fork's native crash fixes (Android sync-gated message calls, iOS client shutdown-before-reinit).
Added Swift Package Manager support for the iOS plugin alongside the existing CocoaPods podspec.

## 0.4.3
Minor Bug Fixes

## 0.4.2
Minor Bug Fixes

## 0.4.1
Delete Message from sId for iOS

## 0.4.0
Delete Message from sId

## 0.3.8
Timezone issue resolved

## 0.3.7
Android version compatible with Android SDK level 36

## 0.3.6
Minor Bug Fixes

## 0.3.5
Minor Bug Fixes

## 0.3.4
Minor Bug Fixes

## 0.3.3
Minor Bug Fixes

## 0.3.2
Minor Bug Fixes

## 0.3.1
Minor Bug Fixes

## 0.3.0
Added supported method in iOS

## 0.2.9
Added participant with name method in android

## 0.2.8
Added function for delete conversation in android

## 0.2.7
Minor Fixes in iOS

## 0.2.6
Error Handling in Android

## 0.2.5
Get attribute on participant list iOS

## 0.2.4
Get attribute on participant list android

## 0.2.3
iOS Unregister Token

## 0.2.2
iOS Minor Bug Fixes

## 0.2.1
iOS Minor Bug Fixes

## 0.2.0
iOS Minor Bug Fixes

## 0.1.9
iOS Minor Bug Fixes

## 0.1.8
Minor Bug Fixes

## 0.1.7
Media Upload Functionality

## 0.1.6
Formatting

## 0.1.5
iOS date related issue resolved

## 0.1.4
iOS attribute related issue resolved

## 0.1.3
Added Support for iOS FCM Registration

## 0.1.2
Initial Release
