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
    apiKey: 'AIzaSyCfiVfQWltpqE_Fi-WAfKAPuIUIBbgr11w',
    appId: '1:898945090390:web:1e2f013fbd70395c654cf7',
    messagingSenderId: '898945090390',
    projectId: 'flutter-shikhi',
    authDomain: 'flutter-shikhi.firebaseapp.com',
    storageBucket: 'flutter-shikhi.appspot.com',
    measurementId: 'G-KMFBQX5HHQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGCuw-uy359Ng0A3PxsiG5PNSv_vX1Fv8',
    appId: '1:898945090390:android:6b13956bea64c86c654cf7',
    messagingSenderId: '898945090390',
    projectId: 'flutter-shikhi',
    storageBucket: 'flutter-shikhi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDOX_8cKPPoQGi7L49gK0bSFlAk6jFKnA',
    appId: '1:898945090390:ios:7c3d7b7d7c83e901654cf7',
    messagingSenderId: '898945090390',
    projectId: 'flutter-shikhi',
    storageBucket: 'flutter-shikhi.appspot.com',
    iosClientId: '898945090390-ffvd5crkm4tcq0nk06jsjkpu6jg9diq9.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterShikhi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDOX_8cKPPoQGi7L49gK0bSFlAk6jFKnA',
    appId: '1:898945090390:ios:7c3d7b7d7c83e901654cf7',
    messagingSenderId: '898945090390',
    projectId: 'flutter-shikhi',
    storageBucket: 'flutter-shikhi.appspot.com',
    iosClientId: '898945090390-ffvd5crkm4tcq0nk06jsjkpu6jg9diq9.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterShikhi',
  );
}
