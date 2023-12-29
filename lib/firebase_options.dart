// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBdmIrR6f9fEB8zNAK0GUpW6_YNAmOK5yQ',
    appId: '1:837948659949:web:5e938737bb964be2e3d4e4',
    messagingSenderId: '837948659949',
    projectId: 'chat-app-d7b83',
    authDomain: 'chat-app-d7b83.firebaseapp.com',
    storageBucket: 'chat-app-d7b83.appspot.com',
    measurementId: 'G-PX0LYXSNSS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnJkhMeuabF2tEVUveNHlsf4W_eg2TOV0',
    appId: '1:837948659949:android:88dc3334934dad38e3d4e4',
    messagingSenderId: '837948659949',
    projectId: 'chat-app-d7b83',
    storageBucket: 'chat-app-d7b83.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgtQxwJOez-wKf0HjgPLwZhveHqVL9OOc',
    appId: '1:837948659949:ios:9c018c59863ebee6e3d4e4',
    messagingSenderId: '837948659949',
    projectId: 'chat-app-d7b83',
    storageBucket: 'chat-app-d7b83.appspot.com',
    iosBundleId: 'com.example.scholarChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDgtQxwJOez-wKf0HjgPLwZhveHqVL9OOc',
    appId: '1:837948659949:ios:311b34df23054b57e3d4e4',
    messagingSenderId: '837948659949',
    projectId: 'chat-app-d7b83',
    storageBucket: 'chat-app-d7b83.appspot.com',
    iosBundleId: 'com.example.scholarChatApp.RunnerTests',
  );
}
