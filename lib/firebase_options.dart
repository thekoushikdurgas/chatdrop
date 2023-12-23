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
    apiKey: 'AIzaSyDE-h4W97Se3aC_x1mOXxWVoSylB2QjTbE',
    appId: '1:497959415907:web:49599061b276a17b858856',
    messagingSenderId: '497959415907',
    projectId: 'chat-drop-4fb9f',
    authDomain: 'chat-drop-4fb9f.firebaseapp.com',
    databaseURL: 'https://chat-drop-4fb9f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'chat-drop-4fb9f.appspot.com',
    measurementId: 'G-T3GT26FDZE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNsiqfMFoQjBGgqsZaqfkovlzZPIc2uEg',
    appId: '1:497959415907:android:e64b01f9dc2ea46e858856',
    messagingSenderId: '497959415907',
    projectId: 'chat-drop-4fb9f',
    databaseURL: 'https://chat-drop-4fb9f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'chat-drop-4fb9f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5Ap3LCt98ju0JXgJbYISwsNGYsTKy0U0',
    appId: '1:497959415907:ios:3b1c081cd2123b51858856',
    messagingSenderId: '497959415907',
    projectId: 'chat-drop-4fb9f',
    databaseURL: 'https://chat-drop-4fb9f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'chat-drop-4fb9f.appspot.com',
    androidClientId: '497959415907-qlop7hedkg23rk1q7osk753tgs5f8rph.apps.googleusercontent.com',
    iosClientId: '497959415907-8b3bnv5217fbfpg1rc287g9rkj19q5h1.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatdrop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5Ap3LCt98ju0JXgJbYISwsNGYsTKy0U0',
    appId: '1:497959415907:ios:f05afb04cee26f48858856',
    messagingSenderId: '497959415907',
    projectId: 'chat-drop-4fb9f',
    databaseURL: 'https://chat-drop-4fb9f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'chat-drop-4fb9f.appspot.com',
    androidClientId: '497959415907-qlop7hedkg23rk1q7osk753tgs5f8rph.apps.googleusercontent.com',
    iosClientId: '497959415907-nq3gpvq5p7f291dqi23bj3c42g1ca0oc.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatdrop.RunnerTests',
  );
}
