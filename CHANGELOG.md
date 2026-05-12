## 0.4.2+tomfit.1
TomFit fork patch bundling two native crash fixes.

**Android — listener sync race fix.** Fixes a race in `ConversationHandler`
where message-reading methods were invoked on a `Conversation` before it had
reached `SynchronizationStatus.ALL`. The native Twilio SDK throws
`IllegalStateException: Messages are not available at the moment. Synchronize
the conversation first.` from `RethrowingForwarder` on the main looper, which
kills the host app and cannot be caught from Dart.

`ConversationHandler.java`: adds a `runWhenSynchronized` helper and a
`ConversationListenerAdapter`, and gates five call sites on the conversation's
sync status — `getAllMessages` (stack-trace site), `getLastMessages` (single
message), `getMessageByIndex` (delete by index), `getUnreadMessagesCount`, and
`findMessageBySid` (delete by SID). On failure or unrecoverable sync state, the
Flutter side receives an empty result (or the existing failure value) instead
of a crash.

**Android & iOS — shut down prior client before re-init.** On logout/re-login
an orphaned `ConversationsClient` could linger and crash later when the server
sent a close/reply frame against a dead transport (TwilsockLib state-machine
transition). `ConversationHandler.java#initializeConversationClient` and
`ConversationHandler.swift#loginWithAccessToken` now call `shutdown()` on any
existing client before creating a new one. The Android guard swallows
`Throwable` from `shutdown()` so init can still proceed if a prior client is
already in a bad state.

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
