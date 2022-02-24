/*
 Created by Thanh Son on 2/24/2022.
 Copyright (c) 2022 . All rights reserved.
*/

import 'dart:mirrors';

import 'package:sample_exception/sample_exception.dart';

/// example
void main() async {
  final exception = SampleException(
    SampleErrorCode.unknown,
    error: Exception("Sample error"),
    message: 'Test sample error',
    stackTrace: StackTrace.current,
    time: DateTime.now(),
  );

  final baseon = SampleException.on('hi', error: exception);
  final baseon2 = NetworkException( error: exception);
  print(baseon);
  print(baseon2);
  // print('Print: ');
  // exception.print();
  // print('Throw: ');
  // throw exception;
}

class NetworkException implements SampleException {
  final SampleException _delegate;

  NetworkException({
    String errorCode = '',
    dynamic error,
    StackTrace? stackTrace,
  }) : _delegate = SampleException.on('network-$errorCode',
            error: error,
            stackTrace: stackTrace,
            time: DateTime.now(),
            message: 'Error in network:');

  @override
  noSuchMethod(Invocation invocation) =>
      reflect(_delegate).delegate(invocation);

  @override
  String toString() {
    // TODO: implement toString
    return _delegate.toString();
  }
}
