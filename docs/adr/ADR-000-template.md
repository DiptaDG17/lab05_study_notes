# ADR

**Date:** 11 November 2026  
**Author:** Dipta Das Gupta
**Milestone:** Lab 5 / Parts 1–7  
**Tool and model used:** ChatGPT (OpenAI GPT-6)

## Context

I was implementing a Flutter Study Notes application using Firebase Authentication, Cloud Firestore, and Firebase Cloud Messaging. The main challenges were handling authentication errors, storing and retrieving notes securely, implementing real-time updates, and receiving push notifications. I used ChatGPT to help implement the required TODO sections while preserving the instructor-provided structure and comments.

## Prompt

```
Complete the TODO sections in my COMP 205 Lab 5 starter files according to the instructor's instructions. Provide the complete code so I can manually copy and paste it. Preserve the original instructor comments and structure, and explain the implementation.
```

## Result

ChatGPT provided implementations for the following components:

- `note.dart`: Firestore data conversion and server timestamps.
- `auth_repository.dart`: Sign-in, sign-up, sign-out, and Firebase authentication error handling.
- `notes_repository.dart`: Real-time note retrieval, title validation, note creation, and deletion.
- `notes_screen.dart`: Notes list, add-note dialog, sign-out button, and swipe-to-delete.
- `firestore.rules`: Rules restricting note access to the authenticated owner and validating titles.
- `messaging_service.dart`: Notification permissions, FCM token retrieval, topic subscription, and foreground messages.
- `own_test.dart`: Additional tests for title length, whitespace trimming, and network error messages.

The implementations used the existing project architecture and Firebase packages.

## Rejected suggestion(s) — at least one

I did not accept relying only on AI-generated implementations and automated unit tests as sufficient evidence that the entire application worked. Unit tests with fake Firestore cannot verify real Firebase security rules or notification delivery. I therefore treated real-device testing, Firestore Rules Playground checks, and notification testing as separate verification requirements rather than assuming they worked because the code compiled.

## Verification

I verified the implementation using the following methods:

- **Automated testing:** Ran `flutter test`, and all tests passed, including the instructor-provided tests and additional tests.
- **Static analysis:** Ran `flutter analyze`, which completed successfully without issues.
- **Code review:** Checked the implementations against the instructor's TODO instructions, including Firebase authentication error messages, note title validation, Firestore document paths, and security rules.

Real Firebase security-rule testing, push-notification delivery, and GitHub CI are verified separately using the screenshots required for submission.

## What I learned

I learned how Firebase Authentication, Cloud Firestore, and Firebase Cloud Messaging work together in a Flutter application. I also learned the importance of validating AI-generated code through automated tests, static analysis, and real Firebase testing rather than relying on generated code alone.


