import 'package:firebase_auth/firebase_auth.dart';

class Authenticationservice {
  FirebaseAuth _firebaseAuth;

  Authenticationservice(this._firebaseAuth);

  Future<String> firebaseLongin(String userEmail, String userpassword) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
          email: userEmail, password: userpassword);

      return "signed in";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "";
    }
  }

  Future<String> firebaseregister(String userEmail, String userPassword) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);

      return "signed up";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "";
    }
  }
}
