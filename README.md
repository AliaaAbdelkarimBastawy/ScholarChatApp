# 📚 Scholar Chat App

A Flutter application that facilitates communication among users within a global chat platform. Users can sign up and log in using Firebase Authentication to access a shared global chatroom. All messages are stored and retrieved from Cloud Firestore, displaying conversations based on the order of their sent time.

## Features

- **Firebase Authentication:** Users can sign up and log in securely using Firebase Authentication.
- **Global Chatroom:** All users have access to the same global chatroom for communication.
- **Real-time Messaging:** Messages are stored and retrieved in real-time using Cloud Firestore.
- **Ordered Message Display:** Messages are displayed based on the order of their sent time.

## Packages Used

- `firebase_core: ^2.24.2` - Firebase Core for Flutter.
- `firebase_auth: ^4.15.3` - Firebase Authentication for user login and signup.
- `modal_progress_hud_nsn: ^0.4.0` - Modal Progress HUD for indicating loading or background processes.
- `cloud_firestore: ^4.13.6` - Cloud Firestore for storing and retrieving chat messages.

## How to Use

1. **User Authentication:**
    - Sign up or log in using Firebase Authentication to access the chatroom.
2. **Global Chat:**
    - Upon authentication, start chatting in the global chatroom shared by all users.
3. **Message Display:**
    - Messages will be displayed in real-time in the order of their sent time.
