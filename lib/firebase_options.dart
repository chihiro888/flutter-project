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
    apiKey: 'AIzaSyA3e2tGL0p2hGGINHLm71nIKPgIIlM5hOQ',
    appId: '1:723425582684:web:1cc1af6e25594d0fed5099',
    messagingSenderId: '723425582684',
    projectId: 'sample-5aae8',
    authDomain: 'sample-5aae8.firebaseapp.com',
    storageBucket: 'sample-5aae8.appspot.com',
    measurementId: 'G-YBN3X5BR0X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAK0CMRGBV4iLFlzQpBML5_yVKMh_2AwlU',
    appId: '1:723425582684:android:825ac4b203b12498ed5099',
    messagingSenderId: '723425582684',
    projectId: 'sample-5aae8',
    storageBucket: 'sample-5aae8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiRG_4yAQlcOULZPwI4dy6FZm6wc5jrGM',
    appId: '1:723425582684:ios:99cabc3760dbe4d8ed5099',
    messagingSenderId: '723425582684',
    projectId: 'sample-5aae8',
    storageBucket: 'sample-5aae8.appspot.com',
    iosBundleId: 'com.example.sample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAiRG_4yAQlcOULZPwI4dy6FZm6wc5jrGM',
    appId: '1:723425582684:ios:155c95605c780bdded5099',
    messagingSenderId: '723425582684',
    projectId: 'sample-5aae8',
    storageBucket: 'sample-5aae8.appspot.com',
    iosBundleId: 'com.example.sample.RunnerTests',
  );
}