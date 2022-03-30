/*
 Created by Thanh Son on 2/24/2022.
 Copyright (c) 2022 . All rights reserved.
*/

import 'dart:core' as core;

import 'dart:core';

/// Depend on Exception,
/// SemiException provide a model, which is contains basic data for handling
/// error and exception.
///
class SampleException<T> implements core.Exception {
  /// if error is SampleException, it will not be generate again
  SampleException(
    core.String errorCode, {
    core.String? message,
    core.dynamic error,
    core.StackTrace? stackTrace,
    core.DateTime? time,
  }) {
    // if (error != null && error is SampleException<T>) {
    //   _errorCode = '[$errorCode]:${error.errorCode}';
    //   this.message = error.message;
    //   this.stackTrace = error.stackTrace;
    //   this.time = error.time;
    //   this.error = error.error;
    // } else {
    //   _errorCode = errorCode;
    //   this.message = message;
    //   this.stackTrace = stackTrace;
    //   this.time = time;
    //   this.error = error;
    // }

    if (error != null && error is SampleException<T>) {
      _errorCode = errorCode;
      this.message = error.message;
      this.stackTrace = error.stackTrace;
      this.time = error.time;
      this.error = error.error;
      tree = error;
    } else {
      _errorCode = errorCode;
      this.message = message;
      this.stackTrace = stackTrace;
      this.time = time;
      this.error = error;
      tree = null;
    }
  }

  core.String get errorCode => _errorCode;

  /// Each exception has a identification code, let the program detach what it
  /// will do next
  late final core.String _errorCode;

  /// Log the message of this exception
  late final core.String? message;

  /// The source error or exception
  late final T? error;

  /// The stackTrace
  late final core.StackTrace? stackTrace;

  /// The time, when exception occurs
  late final core.DateTime? time;

  /// Exception tree
  late final SampleException? tree;

  @core.override
  core.String toString() {
    return getMessage();
  }

  @core.override
  core.bool operator ==(core.Object other) {
    if (core.identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) {
      return false;
    }
    return other is SampleException<T> &&
        time == other.time &&
        errorCode == errorCode;
  }

  /// return a SampleException clone
  SampleException<T> copyWith({
    core.String? errorCode,
    core.String? message,
    T? error,
    core.StackTrace? stackTrace,
    core.DateTime? time,
  }) {
    return SampleException(
      errorCode ?? _errorCode,
      error: error ?? this.error,
      stackTrace: stackTrace ?? this.stackTrace,
      time: time ?? this.time,
      message: message ?? this.message,
    );
  }

  /// Log to console this exception
  void print({core.bool debugMode = true}) {
    core.print(toString());
    core.print(stackTrace);
  }

  core.String getMessage() {
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

  @override
  core.int get hashCode => core.Object.hash(time, errorCode);

  /// get the first exception in tree
  SampleException baseError() {
    if (tree == null) {
      return this;
    } else {
      return tree!.baseError();
    }
  }

  /// return true if the  first exception in tree same [errorCode]
  core.bool checkBaseError<E extends SampleException>([String? errorCode]) {
    final base = baseError();
    if (errorCode != null) {
      return base.errorCode == errorCode && base is E;
    } else {
      return base is E;
    }
  }

  /// get any exception in tree which is first match [errorCode]
  SampleException? whereError<E extends SampleException>([String? errorCode]) {
    if (errorCode == null && this is E) {
      return this;
    } else if (this.errorCode == errorCode && this is E) {
      return this;
    } else {
      return tree?.whereError<E>(errorCode);
    }
  }

  /// return true if the same [errorCode] which match first
  core.bool containsError<E extends SampleException>([String? errorCode]) {
    return whereError<E>(errorCode) != null;
  }
}
