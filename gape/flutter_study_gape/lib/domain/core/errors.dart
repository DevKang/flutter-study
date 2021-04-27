import 'package:flutter_study_gape/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);
  //위의 Error의 constructor를 호출한것?
  @override
  String toString() {
    // TODO: implement toString
    const explanation = "Encountered a ValueFailue at an unrecoverable point. Terminating.";
    return Error.safeToString("$explanation Failure was : $valueFailure");
  }
}
