import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'failures.dart';

/* 4.1
    /core/value_objects.dart에 아래의 코드를 옮기고 abstract로 선언한다.
    abstract를 통해 interface를 구현할 수 있고, 아래와 같이 반복적으로 사용되는 코드들의
    재입력 없이 효과적으로 사용할 수 있게 된다.

    EmailAddress에 한정하지 않고 ValueOject로 변경한다.
*/
@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
