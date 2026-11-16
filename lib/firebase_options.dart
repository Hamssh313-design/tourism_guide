import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: 'demo-api-key',
      appId: '1:1234567890:web:demo',
      messagingSenderId: '1234567890',
      projectId: 'demo-tourism',
      authDomain: 'demo-tourism.firebaseapp.com',
      storageBucket: 'demo-tourism.appspot.com',
    );
  }
}