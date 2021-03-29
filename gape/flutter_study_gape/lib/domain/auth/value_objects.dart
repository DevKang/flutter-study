import 'package:dartz/dartz.dart';
import 'package:flutter_study_gape/domain/core/failures.dart';
import 'package:flutter_study_gape/domain/core/value_objects.dart';
import 'package:flutter_study_gape/domain/core/value_validators.dart';

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

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;
  factory Password(String input) {

    return Password._(validatePassword(input));
  }
  const Password._(this.value);
}
