import 'package:dartz/dartz.dart';
import 'package:my_app/domain/auth/auth_failure.dart';

import 'value_object.dart';

/*3.1 failure을 다루기 위해서
Either을 반환 타입으로 하고
왼쪽은 AuthFailure 타입을 반환하고,
오른쪽은 Unit를 반환한다.
dart에서는 void 타입이 존재하지 않으므로(이는 단순한 keyword일뿐),
이를 대체할 수 있는 
unit을 사용한다.
(unit allows you to represent a single return value that doesn't store any information)

*/
abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
