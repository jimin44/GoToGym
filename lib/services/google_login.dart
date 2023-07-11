import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin{
  void signInWithGoogle() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //
    // if (googleUser != null) {
    //   print('name = ${googleUser.displayName}');
    //   print('email = ${googleUser.email}');
    //   print('id = ${googleUser.id}');
    //
    //   // setState(() {
    //   //   _loginPlatform = LoginPlatform.google;
    //   // });
    // }

    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? _account = await _googleSignIn.signIn();
    if (_account != null) {
      GoogleSignInAuthentication _authentication =
      await _account.authentication;
      OAuthCredential _googleCredential = GoogleAuthProvider.credential(
        idToken: _authentication.idToken,
        accessToken: _authentication.accessToken,
      );
      UserCredential _credential =
      await _firebaseAuth.signInWithCredential(_googleCredential);
      if (_credential.user != null) {
        var user = _credential.user;
        print(user);
      }
    }

  }
}