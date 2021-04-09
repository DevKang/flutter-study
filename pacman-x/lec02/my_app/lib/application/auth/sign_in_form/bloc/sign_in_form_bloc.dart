import 'dart:async';

// ignore: import_of_legacy_library_into_null_safe
/*1.1 
visual studio code에서 bloc을 설치한 후 오른쪽 마우스 클릭 하면 원하는 곳에 bloc component를 한번에
설치할 수 있다.
Bloc은 business logic component이며, event를 수신하게 됩니다.
validated data를 포함하는 output state와 raw data를 포함하는 UI로부터 event를 받습니다.
*/
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:my_app/domain/auth/auth_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app/domain/auth/value_object.dart';
import 'package:my_app/domain/auth/i_auth_facade.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade);

  @override
  SignInFormState get initialState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    
  }
}
