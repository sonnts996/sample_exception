/*
 Created by Thanh Son on 2/24/2022.
 Copyright (c) 2022 . All rights reserved.
*/

import 'dart:core' as core;

part 'sample_error.dart';

/// Depend on Exception,
/// SemiException provide a model, which is contains basic data for handling
/// error and exception.
///
class SampleException<T> implements core.Exception {
  const SampleException(
    this.errorCode, {
    this.message,
    this.error,
    this.stackTrace,
    this.time,
  });

  /// if error is SampleException, it will not be generate again
  static SampleException auto(
    core.String errorCode, {
    core.String? message,
    core.dynamic error,
    core.StackTrace? stackTrace,
    core.DateTime? time,
  }) {
    if (error != null && error is SampleException) {
      return error;
    } else {
      return SampleException(
        errorCode,
        stackTrace: stackTrace,
        error: error,
        message: message,
        time: time,
      );
    }
  }

  /// Each exception has a identification code, let the program detach what it
  /// will do next
  final core.String errorCode;

  /// Log the message of this exception
  final core.String? message;

  /// The source error or exception
  final T? error;

  /// The stackTrace
  final core.StackTrace? stackTrace;

  /// The time, when exception occurs
  final core.DateTime? time;

  /// Log to console this exception
  void print({core.bool debugMode = true}) {
    core.print(toString());
    core.print(stackTrace);
  }

  @core.override
  core.String toString() {
    core.String rs = '$errorCode:';
    if (message != null) {
      rs += ' $message!';
    }

    if (time != null) {
      rs += ' at ${time!.toIso8601String()}';
    }

    if (error != null) {
      rs += '\non ${error.toString()}';
    }
    return rs;
  }
}
