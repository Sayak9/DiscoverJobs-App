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
    apiKey: 'AIzaSyCckk_jmziY8BkQo5DrI2Ee5GpUHOmpdr0',
    appId: '1:524234647571:web:51d9bf4a83e8f68f7f37e6',
    messagingSenderId: '524234647571',
    projectId: 'discoverjobs-e79c2',
    authDomain: 'discoverjobs-e79c2.firebaseapp.com',
    storageBucket: 'discoverjobs-e79c2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8-3XMpH34zn-sRhYWVbw3QqxTtGpxwec',
    appId: '1:524234647571:android:1d4b9cc80cc345037f37e6',
    messagingSenderId: '524234647571',
    projectId: 'discoverjobs-e79c2',
    storageBucket: 'discoverjobs-e79c2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5ClUNlWok8zjzLu8LQoTkHRrO5kx_jeQ',
    appId: '1:524234647571:ios:3d53e42bb7a90b4f7f37e6',
    messagingSenderId: '524234647571',
    projectId: 'discoverjobs-e79c2',
    storageBucket: 'discoverjobs-e79c2.appspot.com',
    iosBundleId: 'com.example.discoverjobs',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5ClUNlWok8zjzLu8LQoTkHRrO5kx_jeQ',
    appId: '1:524234647571:ios:3d53e42bb7a90b4f7f37e6',
    messagingSenderId: '524234647571',
    projectId: 'discoverjobs-e79c2',
    storageBucket: 'discoverjobs-e79c2.appspot.com',
    iosBundleId: 'com.example.discoverjobs',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCckk_jmziY8BkQo5DrI2Ee5GpUHOmpdr0',
    appId: '1:524234647571:web:e33a425dee4940e97f37e6',
    messagingSenderId: '524234647571',
    projectId: 'discoverjobs-e79c2',
    authDomain: 'discoverjobs-e79c2.firebaseapp.com',
    storageBucket: 'discoverjobs-e79c2.appspot.com',
  );
}
