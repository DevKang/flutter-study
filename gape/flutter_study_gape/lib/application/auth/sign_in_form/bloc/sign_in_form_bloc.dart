import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_study_gape/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import 'package:flutter_study_gape/domain/auth/auth_failure.dart';
import 'package:flutter_study_gape/domain/auth/value_objects.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(
    this._authFacade,
  ) : super(SignInFormState.initial());
  // 강의와 다르게 super로 감싼 이유는 무엇? , override가 안붙은 이유

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    //yield<- 누구세요?
    yield* event.map(
        emailChanged: (e) async* {
          yield state.copyWith(
            emailAddress: EmailAddress(e.emailStr),
            authFailureOrSuccess: null,
          );
        },
        passwordChanged: (e) async* {
          yield state.copyWith(
            password: Password(e.passwordStr),
            authFailureOrSuccess: null,
          );
        },
        registerWithEmailAndPasswordPressed: (e) async* {
          yield* this._performActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.registerWithEmailAndPassword,
          );
        },
        signInWithEmailAndPasswordPressed: (e) async* {
          yield* this._performActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.signInWithEmailAndPassword,
          );
        },
        signInWithGooglePressed: (e) async* {
          yield state.copyWith(
            isSubmitting: true,
            authFailureOrSuccess: null,
          );
          final result = await this._authFacade.signInWithGoogle();
          yield state.copyWith(
            isSubmitting: true,
            authFailureOrSuccess: result,
          );
        }
    );
  }
  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
     Future<Either<AuthFailure, Unit>> Function(
      EmailAddress emailAddress,
      Password password,
    )
        forwardedCall,
  ) async* {
    Either<AuthFailure, Unit>? result;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccess: null,
      );
      result = await forwardedCall(
        state.emailAddress,
        state.password,
      );
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccess: result,
    );
  }
}
