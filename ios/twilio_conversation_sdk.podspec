#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint twilio_conversation_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'twilio_conversation_sdk'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  # Source lives under twilio_conversation_sdk/Sources/twilio_conversation_sdk so it is
  # shared, unmodified, between this podspec (CocoaPods) and twilio_conversation_sdk/Package.swift
  # (Swift Package Manager) - see https://docs.flutter.dev/packages-and-plugins/swift-package-manager/for-plugin-authors
  s.source_files = 'twilio_conversation_sdk/Sources/twilio_conversation_sdk/**/*.swift'
  s.dependency 'Flutter'
  # NOTE: this constraint is intentionally looser than the one in Package.swift.
  # Twilio stopped publishing TwilioConversationsClient to CocoaPods trunk after
  # 4.0.2 (4.0.3+ are GitHub/SPM-only releases), so '~> 4.0' resolves to 4.0.2 here
  # - the newest version this podspec can actually get. Do not bump this to match
  # Package.swift's floor; that broke `pod install` entirely (see CHANGELOG for
  # v0.4.3+tomfit.2). If Twilio ever resumes CocoaPods releases, '~> 4.0' will
  # pick those up automatically without another manual bump.
  s.dependency 'TwilioConversationsClient', '~> 4.0'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'twilio_conversation_sdk_privacy' => ['twilio_conversation_sdk/Sources/twilio_conversation_sdk/PrivacyInfo.xcprivacy']}
end
