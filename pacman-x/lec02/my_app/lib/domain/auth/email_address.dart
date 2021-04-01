class EmailAddress {
  final String value;

  /* 1.1 const Constructor
  const Constructor로 object를 만들게 되면 초기화 과정에서 const EmailAddress("sr9872@naver.com")  
  와 같은 형태로 초기화 할 수 있다. 만약 이와 같이 초기화 하게 된다면 서로 다른 object를 만들어 performace에 문제를
  일으키는 것이 아니라, 재사용가능하게 할 수 있다.
*/

  const EmailAddress(this.value);

  /* 1.2 == Operator 처리
  메모리 주소는 다르더라도 email value의 값이 동일하다면 문제가 발생! 즉, 동일한 회원 email로 가입할 수 없게 해야 한다.
  따라서 아래와 같은 == operator를 override해줘야 하는데 값이 같은 경우에도 같은 것으로 판단해야 하기 때문이다.
  즉, 주소가 같고 값이 동일한 경우를 빨리 찾기(indentical)
  주소는 다른데 값이 같은 경우를 찾기.. -> 아래에 구현
   */

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmailAddress && other.value == value;
  }

  /* 1.3 hasCode
  ==Operator를 override하게 되면 hashCode 또한 override해야 한다.
  */

  @override
  int get hashCode => value.hashCode;
}

// 하지만 value에 우리가 원하는 email 값이 들어오지 않는 경우가 발생할 수 있다. 따라서 이를 수정할 필요가 있음
