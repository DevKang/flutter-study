import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

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
