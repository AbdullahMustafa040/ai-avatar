import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAbq5Zya_WKRTf98j7DVJfx8ZqDa-BN6Fc",
            authDomain: "aiavatar-947dc.firebaseapp.com",
            projectId: "aiavatar-947dc",
            storageBucket: "aiavatar-947dc.appspot.com",
            messagingSenderId: "418900453194",
            appId: "1:418900453194:web:d00cd38c964a73cf8143b3",
            measurementId: "G-J5SNXMHFPN"));
  } else {
    await Firebase.initializeApp();
  }
}
