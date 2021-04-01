import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'failures.freezed.dart';

class EmailAddress {
  // final String value;
  final Either<ValueFailure<String>, String> value;
  // final Either<Left, Right> failure;
  /*1
  3.1 Either
    Left는 통상 fail Right가 Success
  */

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmailAddress && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    throw left(ValueFailure.invalidEmail(failedValue: input));
  }
}

/* 3.5 freezed
 union case에서 valueFailure를 handling해야 한다.
 아래 와 같은 코드르 작성해 우리는 해결할 수 있다.
*/
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required String failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required T failedValue,
  }) = ShortPassword<T>;
}

/* 3.3 interface
각각의 error case에 대해서 공통되는 점들을 파악할 수 있다. 따라서 abstract라는 키워드를 통해
interface를 생성후 각각의 error가 implements해서 사용할 수 있도록 한다.
*/

// class InvalidEmailFailure {
//   final String failedValue;

//   InvalidEmailFailure({required this.failedValue});
// }

/* 3.2 
Invalidpassword에 대한 class도 생성해 준다.
물론 이부분은 demonstaration을 위한 것으로 후에 삭제 되게 된다.
*/

// class InvalidPasswordFailure {
//   final String failedValue;

//   InvalidPasswordFailure({required this.failedValue});
// }

/* 3.4 디펜던시 설치하기
union type이라던지 code generator를 사용하기 위해 아래의 dependencies를 설치해 준다.
dependencies:
  flutter:
    sdk: flutter
  dartz: ^0.9.0-dev.6
  freezed_annotation: ^0.7.1

dev_dependencies:
  build_runner:
  freezed: ^0.9.2
*/
