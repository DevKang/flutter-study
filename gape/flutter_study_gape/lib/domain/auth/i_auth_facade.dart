import 'package:dartz/dartz.dart';
import 'auth_failure.dart';
import 'value_objects.dart';

abstract class IAuthFacade {
  //어떻게 Fail이나 예외를 잘 처리할 것인가
  Future<Either<AuthFailure,Unit>> registerWithEmailAndPassword(
    //void는 클래스가 아님, 단순한 키워드(dart에서)
    EmailAddress emailAddress, 
    Password password,
    );
  Future<Either<AuthFailure,Unit>> signInWithEmailAndPassword(
    EmailAddress emailAddress, 
    Password password,
    );
  Future<Either<AuthFailure,Unit>> signInWithGoogle();
  
}
//다트가 추상만을 제공한다는 것을 아는 인터페이스?
//Facade는 인터페이스가 있는 둘 이상의 클래스를 하나의 단순화된
//인터페이스로 연결하기 위한 "디자인 패턴"
//이 경우 Firebase Auth와 Google로그인을 연결
