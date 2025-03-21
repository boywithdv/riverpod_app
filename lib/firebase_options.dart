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
    apiKey: 'AIzaSyCAzf1STeHjzJ2a5JZUE0m2NEijnSEpHps',
    appId: '1:477263771153:web:50b133841a9d92f9bb23b0',
    messagingSenderId: '477263771153',
    projectId: 'riverpodsampleapp',
    authDomain: 'riverpodsampleapp.firebaseapp.com',
    storageBucket: 'riverpodsampleapp.firebasestorage.app',
    measurementId: 'G-EXNJNLZMKS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4Z8UECnJUeNVnVOIjBd_RZnel8Iq7W08',
    appId: '1:477263771153:android:fd510108e192950ebb23b0',
    messagingSenderId: '477263771153',
    projectId: 'riverpodsampleapp',
    storageBucket: 'riverpodsampleapp.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCC5LlDMzXK9_esljHTtYp11BDlyRDyZUw',
    appId: '1:477263771153:ios:ab8de0afb2606681bb23b0',
    messagingSenderId: '477263771153',
    projectId: 'riverpodsampleapp',
    storageBucket: 'riverpodsampleapp.firebasestorage.app',
    iosBundleId: 'com.example.riverpodApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCC5LlDMzXK9_esljHTtYp11BDlyRDyZUw',
    appId: '1:477263771153:ios:ab8de0afb2606681bb23b0',
    messagingSenderId: '477263771153',
    projectId: 'riverpodsampleapp',
    storageBucket: 'riverpodsampleapp.firebasestorage.app',
    iosBundleId: 'com.example.riverpodApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCAzf1STeHjzJ2a5JZUE0m2NEijnSEpHps',
    appId: '1:477263771153:web:34abc519d04fb8f7bb23b0',
    messagingSenderId: '477263771153',
    projectId: 'riverpodsampleapp',
    authDomain: 'riverpodsampleapp.firebaseapp.com',
    storageBucket: 'riverpodsampleapp.firebasestorage.app',
    measurementId: 'G-ZBCPBD1FFN',
  );
}
