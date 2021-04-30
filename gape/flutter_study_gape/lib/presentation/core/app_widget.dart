import 'package:flutter/material.dart';
import 'package:flutter_study_gape/presentation/core/sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material App",
      home: SignInPage(),
    );
  }
}