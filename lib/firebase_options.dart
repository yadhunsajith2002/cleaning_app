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
    apiKey: 'AIzaSyCpioc7kz0l3rAC9pyr1zP_vu0toRHs4K4',
    appId: '1:452154437726:web:012f248d112dc16518c4cf',
    messagingSenderId: '452154437726',
    projectId: 'cleaning-app-3d7ba',
    authDomain: 'cleaning-app-3d7ba.firebaseapp.com',
    storageBucket: 'cleaning-app-3d7ba.appspot.com',
    measurementId: 'G-31XZZKNDH8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpvlqwfgGlA4ii2bI8Y75LbvgqXYyx20c',
    appId: '1:452154437726:android:d58ffc41fe166b4f18c4cf',
    messagingSenderId: '452154437726',
    projectId: 'cleaning-app-3d7ba',
    storageBucket: 'cleaning-app-3d7ba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvdoqM6rmj8G0cJK3Apu6iQWtapNiRrpY',
    appId: '1:452154437726:ios:69a0e15273138b7118c4cf',
    messagingSenderId: '452154437726',
    projectId: 'cleaning-app-3d7ba',
    storageBucket: 'cleaning-app-3d7ba.appspot.com',
    iosBundleId: 'com.example.cleaningApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBvdoqM6rmj8G0cJK3Apu6iQWtapNiRrpY',
    appId: '1:452154437726:ios:030b2141612a9f7c18c4cf',
    messagingSenderId: '452154437726',
    projectId: 'cleaning-app-3d7ba',
    storageBucket: 'cleaning-app-3d7ba.appspot.com',
    iosBundleId: 'com.example.cleaningApp.RunnerTests',
  );
}