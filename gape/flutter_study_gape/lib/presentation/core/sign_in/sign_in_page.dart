import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_study_gape/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:flutter_study_gape/presentation/core/sign_in/widgets/sign_in_form.dart';
import 'package:flutter_study_gape/presentation/injection.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: SignInForm(),
        ),
    );
  }
}
