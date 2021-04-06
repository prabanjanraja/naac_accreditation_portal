import 'package:firebase_auth/firebase_auth.dart';
import 'package:naac_accreditation_portal/models/User.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  create custom user model from firebase user object
  CustomUser _userFromFirebase(User input) {
    return CustomUser(
      uid: input.uid,
      name: ' ',
    );
    /* input != null
        ? CustomUser(
            uid: input.uid,
            name: '',
          )
        : null; */
  }

  // stream to return uid if user login or null if user logout
  Stream<CustomUser> get userstream {
    return _auth
        .authStateChanges()
        .map((event) => event != null ? _userFromFirebase(event) : null);
  }

  // Signin anonymously
  Future singInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User _user = result.user;
      return _userFromFirebase(_user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sigin with email and password
  Future<CustomUser> signIn(email, password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User _user = result.user;
      return _userFromFirebase(_user);
    } catch (e) {
      print(e.toString());
      print('invalid credentials');
      return null;
    }
  }

  // Register with email and password
  //Signout
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
