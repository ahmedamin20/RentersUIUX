import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:ksb/core/services/error/failuar.dart';

class FaceBookHelper
{
  FaceBookHelper._();
  static final FaceBookHelper instance = FaceBookHelper._();
  Future<Either<Failure , String>> loginFaceBook()
 async
 {
    final LoginResult result =
    await FacebookAuth.instance.login(); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = result.accessToken!;
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);
      final  firebaseAuth = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      print(firebaseAuth.user!.email);
      print(firebaseAuth.user!.displayName);
      print(firebaseAuth.user!.photoURL);
      return right(firebaseAuth.credential!.accessToken!);
    } else {
      // login failed
      print(result.status);
      return left(FailureLocal(message: result.message!));
    }

  }
}