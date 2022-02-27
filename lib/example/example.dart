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

  final baseon = SampleException('hi', error: exception);
  final baseon2 = NetworkException(error: exception);
  print(baseon);
  print(baseon2);
  // print('Print: ');
  // exception.print();
  // print('Throw: ');
  // throw exception;
}

class NetworkException extends SampleException {
  NetworkException({
    String errorCode = '',
    dynamic error,
    StackTrace? stackTrace,
  }) : super(errorCode,
            error: error,
            stackTrace: stackTrace,
            time: DateTime.now(),
            message: 'Error in network:');

  @override
  // TODO: implement errorCode
  String get errorCode => 'network-${super.errorCode}';
}
