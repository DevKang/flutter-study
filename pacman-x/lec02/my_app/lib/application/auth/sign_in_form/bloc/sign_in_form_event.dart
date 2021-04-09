part of 'sign_in_form_bloc.dart';

/* 1.2 
어떤 event를 받을 수 있는 상상을 한번 해봅시다.
email, password를 변경하거나, email또는 password로 로그인, 등록하거나, google로 등록하거나와 같은 상황을
상상할 수 있습니다.
이를 abstract class로 구현합니다.
sign_in_form_event는 sign_in_form_bloc.dart의 일부분임으로(part of를 통해..)
현재와 파일과 관련되 freezed generating code도 form에서 작성합니다.
*/
@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory SignInFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory SignInFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;
}