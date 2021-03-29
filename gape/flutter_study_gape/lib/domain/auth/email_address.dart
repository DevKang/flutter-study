class EmailAddress {
  final String value;
  //여기서 쓰이는 것은 아니지만 final에 대해서
  //final : 상수지만 런타임에서 변화(결정)하는 값도 넣을 수 있다.
  //But const는 사용할 수 없다.
  const EmailAddress(this.value) :assert(value != null);

  @override
    String toString() => 'EmailAddress(value: $value)';
    //02 toString 생성  

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is EmailAddress &&
      other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
  //data class generator사용 ->메소드 생성기
  // 01 Cmd + . (단축키) 

  
}
