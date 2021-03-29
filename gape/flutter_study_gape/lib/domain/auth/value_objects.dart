import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_gape/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_address.freezed.dart';

class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;
  //01 여기서 쓰이는 것은 아니지만 final에 대해서
  //final : 상수지만 런타임에서 변화(결정)하는 값도 넣을 수 있다.
  //But const는 사용할 수 없다.

  //02 Exception  [Exception]은 오류가 프로그래밍 방식으로
  //해결 될 수 있도록 오류에 대한 정보를 사용자에게 전달하기위한 것입니다.
  //catch하기 위한 것이며 유용한 데이터 필드를 포함해야합니다.

  //03 이후 나올 유니온을 사용하면 유용하다는 언급
  factory EmailAddress(String input) {
    assert(input != null);
    //예외/에러 사항 제어하기
    //assert는 개발 모드의 debug중일 때에만 영향을 미치며,
    //배포(production) 코드에서는 프로그램에 영향을 주지 않는다.
    //조건이 거짓인 경우 실행이 중단된다.

    return EmailAddress._(validateEmailAddress(input));
  }
  //factory 키워드를 사용해서 생성자를 구현하면 해당클래스의 인스턴스를 새로 만들지 않아도 됨
  const EmailAddress._(this.value);

  // @override
  // String toString() => 'EmailAddress($value)';
  // //02 toString 생성

  // @override
  // bool operator ==(Object justName) {
  //   if (identical(this, justName)) return true;

  //   return justName is EmailAddress && justName.value == value;
  // }

  // @override
  // int get hashCode => value.hashCode;
  // //data class generator사용 ->메소드 생성기
  // // 01 Cmd + . (단축키)
  // //operator 생성
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
    //RegExp은 정규식이랑 다르면 예외를 발생시키는거고
    //hasMatch는 받은 문자열이 정규식과 같은지 비교하는 함수
  } else {
    //보통 null을 사용?
    return left(ValueFailure.invalidEmail(failedValue: input));
    //여기서 사용
  }
}

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required String failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    required String failedValue,
  }) = ShortPassword<T>;
}

// class InvalidEmailFailure {
//   final String failedValue;

//   InvalidEmailFailure({@required this.failedValue});
//   //잘못된 이메일 형식 발생시 사용되는 함수
// }

// // void f() {
// //   try {
// //     EmailAddress("dasdflkm");
// //   } on InvalidEmailException catch (e) {
// //     // asdf?
// //   } on ExceedLenghtException catch (e) {
// //     //asdfasdf
// //   }
// // }
// // 위의 예외 사항 말고도 여러 경우, (너무 긴 문자열,특수문자포함된 아이디)등의
// // 사항도 추가할 수 있다. 하지만 모든 예외를 찾아서 적는것이 베스트는 아님
// void insideTheUI(EmailAddress emailAddress) {
//   if (emailAddress.failure == null) {
//     emailAddress.value;
//   } else {
//     //Error Snackbar
//   }
// }

void showingTheEmailAddressOrFailure() {
  final emailAddress = EmailAddress("asldfj");

  String emailText = emailAddress.value
      .fold((l) => "Failure happend, more precisely: $left", (r) => r);
  String emailText2 =
      emailAddress.value.getOrElse(() => "some failure happend");
}
