## 0.4.2+tomfit.1
TomFit fork patch (Android only). Fixes a listener sync race in
`ConversationHandler` where message-reading methods were invoked on a
`Conversation` before it had reached `SynchronizationStatus.ALL`. The native
Twilio SDK throws `IllegalStateException: Messages are not available at the
moment. Synchronize the conversation first.` from `RethrowingForwarder` on the
main looper, which kills the host app and cannot be caught from Dart.

`ConversationHandler.java`: adds a `runWhenSynchronized` helper and a
`ConversationListenerAdapter`, and gates five call sites on the conversation's
sync status — `getAllMessages` (stack-trace site), `getLastMessages` (single
message), `getMessageByIndex` (delete by index), `getUnreadMessagesCount`, and
`findMessageBySid` (delete by SID). On failure or unrecoverable sync state, the
Flutter side receives an empty result (or the existing failure value) instead
of a crash.

iOS is unchanged in this release.

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
