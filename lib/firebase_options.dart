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
    apiKey: 'AIzaSyBjjOsxJ9WqxpvYv0svLXyPxFssHBwhI08',
    appId: '1:82398540890:web:7abc9d2e3e6cb61272d463',
    messagingSenderId: '82398540890',
    projectId: 'fir-mws-a4247',
    authDomain: 'fir-mws-a4247.firebaseapp.com',
    storageBucket: 'fir-mws-a4247.firebasestorage.app',
    measurementId: 'G-2QJTKDXBN6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnCm2Oj7blG9caA-iaONbTZP66jPiybqw',
    appId: '1:82398540890:android:6ad64dc28175a66072d463',
    messagingSenderId: '82398540890',
    projectId: 'fir-mws-a4247',
    storageBucket: 'fir-mws-a4247.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuKbfxJnyzFrSCzj6HP9JX8QteBkimuY4',
    appId: '1:82398540890:ios:963774ff1fa08a3272d463',
    messagingSenderId: '82398540890',
    projectId: 'fir-mws-a4247',
    storageBucket: 'fir-mws-a4247.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebaseMws',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCuKbfxJnyzFrSCzj6HP9JX8QteBkimuY4',
    appId: '1:82398540890:ios:963774ff1fa08a3272d463',
    messagingSenderId: '82398540890',
    projectId: 'fir-mws-a4247',
    storageBucket: 'fir-mws-a4247.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebaseMws',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBjjOsxJ9WqxpvYv0svLXyPxFssHBwhI08',
    appId: '1:82398540890:web:e1702777bb40e0d472d463',
    messagingSenderId: '82398540890',
    projectId: 'fir-mws-a4247',
    authDomain: 'fir-mws-a4247.firebaseapp.com',
    storageBucket: 'fir-mws-a4247.firebasestorage.app',
    measurementId: 'G-BPS9756X57',
  );

}