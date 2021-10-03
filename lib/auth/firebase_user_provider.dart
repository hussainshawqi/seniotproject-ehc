import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FinalProjectFirebaseUser {
  FinalProjectFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

FinalProjectFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FinalProjectFirebaseUser> finalProjectFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FinalProjectFirebaseUser>(
            (user) => currentUser = FinalProjectFirebaseUser(user));
