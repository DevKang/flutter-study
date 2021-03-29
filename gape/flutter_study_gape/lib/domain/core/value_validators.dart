import 'package:dartz/dartz.dart';
import 'package:flutter_study_gape/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
    //RegExp은 정규식이랑 다르면 예외를 발생시f키는거고
    //hasMatch는 받은 문자열이 정규식과 같은지 비교하는 함수
  } else {
    //보통 null을 사용?
    return left(ValueFailure.invalidEmail(failedValue: input));
    //여기서 사용
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}


