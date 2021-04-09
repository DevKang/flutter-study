part of 'sign_in_form_bloc.dart';

//이 이벤트는 프레젠테이션 레이어에서 블록으로 들어올 것
//

@freezed
abstract class SignInFormEvent with _$SignInFormEvent{
  const factory SignInFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory SignInFormEvent.passwordChanged(String passwordStr) = PasswordChanged;
  const factory SignInFormEvent.registerWithEmailAndPasswordPressed() =
   RegisterWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithEmailAndPasswordPressed() = 
  SignInWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed() = 
  SignInWithGooglePressed;
}