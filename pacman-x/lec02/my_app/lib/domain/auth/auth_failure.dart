import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

/*2.1
Auth 과정에서 발생할 수 있는 다양한 오류를 아래의 과정에서 구현해 준다.
freezed를 통해 코드 generation을 할때는 아래의 shell script를 실행해서
build를 해주어야 code가 generate된다.

flutter pub run build_runner watch --delete-conflicting-outputs

*/

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}