import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_gape/domain/core/errors.dart';
import 'package:flutter_study_gape/domain/core/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  T getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), id);
    //id->무언가를 받고 변경되지 않은 값을 return
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object justName) {
    if (identical(this, justName)) return true;

    return justName is ValueObject<T> && justName.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
