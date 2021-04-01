class EmailAddress {
  final String value;

/* 2.2 factory
  factory는 constructor가 인스턴스를 만드는 것 이상의 것들을 수행하고자 할때 사용한다.
  1. cache로부터 인스턴스를 반환하거나
  2. 하위 클레스의 인스턴스를 반환하거나
  3. 또는 initializer list에서 다루어지지 않는 로직을 사용하는 final 변수를 초기화 하거나
  4. 물론 싱글톤에서도 사용한다.
*/

/* 2.4 factory Constructor
validateEmailAddress에서도 반환값이 string 타입이기 때문에 아래와 같이 표현한다.
*/

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);

  /* 2.1 private underscore
  1. static factory method만 해당 constructor에 접근해서 사용할 수 있도록 하거나,
  2. object copying을 막기 위해서 사용하기도 한다.
  3. 또는 해당 class가 unitliy 클레스인 경우에도 사용한다.
  */

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmailAddress && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

/*
2.3 validateEmailAddress
적절한 input값인지를 아래의 함수에서 확인한다.
만약 적절하지 않은 경우에는 Exeption의 기능들을 확장한 InvalidEmailException을 초기화하여 인스턴스르 반환하도록 한다.
*/

String validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return input;
  } else {
    throw InvalidEmailException(failedValue: input);
  }
}

class InvalidEmailException implements Exception {
  final String failedValue;

  InvalidEmailException({required this.failedValue});
}

/*
다음으로 넘어가기
그런데 우리는 위와 같이 선언하고 사용하려고 한다면 try catch 문을 계속해서 사용해야 하는 번거로움이 발생하게 된다.
이를 극복해보자.
*/
