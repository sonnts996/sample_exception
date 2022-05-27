/*
 Created by Thanh Son on 2/24/2022.
 Copyright (c) 2022 . All rights reserved.
*/

import 'package:sample_exception/sample_exception.dart';

/// example
void main() async {
  final exception = SampleException<Exception>(
    SampleErrorCode.unknown,
    error: Exception("Sample error"),
    message: 'Test sample error',
    stackTrace: StackTrace.current,
    time: DateTime.now(),
  );

  final baseon = SampleException(SampleErrorCode.unknown, error: exception);
  final baseon2 = NetworkException(error: baseon);
  final baseon3 = BlocException(error: baseon2);
  final rs1 = baseon3.containsError('hi');
  final rs2 = baseon3.whereError<NetworkException>('network-');
  final rs3 = baseon3.baseError();
  final rs4 = baseon3.checkBaseError('hi');
  final rs5 = baseon3.checkBaseError(SampleErrorCode.unknown);
  final rs6 = baseon3.whereError('test');
  final rs7 =
      baseon3.whereError<SampleException<Exception>>(SampleErrorCode.unknown);
  final rs8 = baseon3.checkBaseError<SampleException>(SampleErrorCode.unknown);
  final rs9 = baseon3.containsError<NetworkException>();
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

class BlocException extends SampleException {
  BlocException({
    String errorCode = '',
    dynamic error,
    StackTrace? stackTrace,
  }) : super(errorCode,
            error: error,
            stackTrace: stackTrace,
            time: DateTime.now(),
            message: 'Error in bloc:');

  @override
  // TODO: implement errorCode
  String get errorCode => 'bloc-${super.errorCode}';
}
