import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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
    iosClientId:
        '723425582684-91pa3hkgqtsju33d3ap2v9o4gs861d4t.apps.googleusercontent.com',
    iosBundleId: 'com.example.sample',
  );
}
