// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDtCKhGf7sPR5BDCWBc7zCG9P95-uoiJ9M',
    appId: '1:182279110463:web:8d42b69e0240623730dd8a',
    messagingSenderId: '182279110463',
    projectId: 'chatbot-apps-7940a',
    authDomain: 'chatbot-apps-7940a.firebaseapp.com',
    storageBucket: 'chatbot-apps-7940a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDd65m8CUgPdXQ3nC_04fm6QYNH9OoPRO8',
    appId: '1:182279110463:android:f88ccebc7937c2b930dd8a',
    messagingSenderId: '182279110463',
    projectId: 'chatbot-apps-7940a',
    storageBucket: 'chatbot-apps-7940a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWGveKzcjPh_NFmsWBfOeFFlBjxjFvvdQ',
    appId: '1:182279110463:ios:8fce60430037fc7430dd8a',
    messagingSenderId: '182279110463',
    projectId: 'chatbot-apps-7940a',
    storageBucket: 'chatbot-apps-7940a.appspot.com',
    iosBundleId: 'com.chatbot.apps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWGveKzcjPh_NFmsWBfOeFFlBjxjFvvdQ',
    appId: '1:182279110463:ios:b794709b6733809230dd8a',
    messagingSenderId: '182279110463',
    projectId: 'chatbot-apps-7940a',
    storageBucket: 'chatbot-apps-7940a.appspot.com',
    iosBundleId: 'com.example.chatApps',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDtCKhGf7sPR5BDCWBc7zCG9P95-uoiJ9M',
    appId: '1:182279110463:web:d8521a54fdcc661e30dd8a',
    messagingSenderId: '182279110463',
    projectId: 'chatbot-apps-7940a',
    authDomain: 'chatbot-apps-7940a.firebaseapp.com',
    storageBucket: 'chatbot-apps-7940a.appspot.com',
  );
}
