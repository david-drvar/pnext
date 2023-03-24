import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MyPNextFirebaseUser {
  MyPNextFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MyPNextFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MyPNextFirebaseUser> myPNextFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MyPNextFirebaseUser>(
      (user) {
        currentUser = MyPNextFirebaseUser(user);
        return currentUser!;
      },
    );
