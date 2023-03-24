import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDOHGJtnAZgTaDqE_0E5wY11bNDTGhi08o",
            authDomain: "mypnext.firebaseapp.com",
            projectId: "mypnext",
            storageBucket: "mypnext.appspot.com",
            messagingSenderId: "1057573320885",
            appId: "1:1057573320885:web:6d0d71ea336fa7994b66fc",
            measurementId: "G-VSV0MD60J1"));
  } else {
    await Firebase.initializeApp();
  }
}
