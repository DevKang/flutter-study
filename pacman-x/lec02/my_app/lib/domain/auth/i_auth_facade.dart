import 'package:dartz/dartz.dart';
import 'package:my_app/domain/auth/auth_failure.dart';

import 'value_object.dart';

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
