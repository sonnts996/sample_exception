/*
 Created by Thanh Son on 2/24/2022.
 Copyright (c) 2022 . All rights reserved.
*/

import 'package:sample_exception/sample_exception.dart';

void main() async {
  final exception = SampleException(
    SampleErrorCode.unknown,
    error: Exception("Sample error"),
    message: 'Test sample error',
    stackTrace: StackTrace.current,
    time: DateTime.now(),
  );
  print('Print: ');
  exception.print();
  print('Throw: ');
  throw exception;
}
