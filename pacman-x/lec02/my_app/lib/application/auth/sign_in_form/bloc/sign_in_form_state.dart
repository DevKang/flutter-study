part of 'sign_in_form_bloc.dart';

/*1.3
sign-in form에서 다루어야 하는 상태는 다음과 같습니다.
1. validated value
email, password가 적절하게 들어왔는지 그렇지 않다면 error message를 TextFormField에 보여야 합니다.
2. Auth progress
sign in이 진행되고 있음을 보여주는 indicator를 bool isSubmitting
3. Success or error backend response
backend에서 무엇인가 잘못되었을 때를 snackbar를 통해 보여주기 위해 Either<AuthFailure, Unit>를 사용하게 됩니다.
그러나 유저로부터의 interaction이 없다면 null을 authFailureOrSuccess에 할당해야 합니다.
더 좋은 선택지는 Option이며, 이는 Some, None으로 구성되어 있습니다.
*/
@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
