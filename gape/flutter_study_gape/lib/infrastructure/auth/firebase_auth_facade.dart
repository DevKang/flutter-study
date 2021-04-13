//IO facade가 도메인 레이어에 있는 이유
//인터페이스는 타사 종속성과 완전히 독립적 <-- ?
//facade활용에 필요한 firebase와 일부 사용자 정의 인증 솔루션때문에

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_gape/domain/auth/value_objects.dart';
import 'package:flutter_study_gape/domain/auth/auth_failure.dart';
import 'package:flutter_study_gape/domain/core/errors.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_study_gape/domain/auth/i_auth_facade.dart';

class FacadeAuthFirebase implements IAuthFacade {
//class 는 class 자신의 모든 멤버를 포함하는 interface 를 정의하게 된다.
//implements 를 사용해 다른 class 의 interface 가 사용하는 API 를 사용할 수 있다.

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  //이전에 firebase 설정에서 추가한것들이 자동으로
  //코드에 반영이 되었나보다.

  FacadeAuthFirebase(this._firebaseAuth, this._googleSignIn);

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
    EmailAddress emailAddress,
    Password password,
  ) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    //값을 받거나 못받는 경우만 생각합니다. why? : 이미 signInForm에서 address 유효성에 대한
    //검사를 진행하기 때문에 오는 값은 정상적인 값 or 실패만 옵니다.
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailAddressStr, password: passwordStr);
      return right(unit);
    } on PlatformException catch (e) {
      if (e.code == "email-already-in-use") {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
    EmailAddress emailAddress,
    Password password,
  ) async {
    // TODO: implement signInWithEmailAndPassword
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    //값을 받거나 못받는 경우만 생각합니다. why? : 이미 signInForm에서 address 유효성에 대한
    //검사를 진행하기 때문에 오는 값은 정상적인 값 or 실패만 옵니다.
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddressStr, password: passwordStr);
      return right(unit);
    } on PlatformException catch (e) {
      if (e.code == "wrong-password" || e.code == "user-not-found") {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(AuthFailure.cancelledByUser());
      }
      final googleAuthentication = await googleUser.authentication;

      final AuthCredential = GoogleAuthProvider.credential(
          idToken: googleAuthentication.idToken,
          accessToken: googleAuthentication.accessToken);
      return _firebaseAuth
          .signInWithCredential(AuthCredential)
          .then((r) => right(unit));
    } on PlatformException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }
}
