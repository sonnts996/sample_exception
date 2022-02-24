## Getting started

Add dependency to your pubspec.yaml:

```yaml
custom_state: 'any'
```

## Usage

Import packages:

```dart
import 'package:sample_exception/sample_exception.dart';
```

### Exception:

```dart
final exception = SampleException(
  SampleErrorCode.unknown,
  error: Exception("Sample error"),
  message: 'Test sample error',
  stackTrace: StackTrace.current,
  time: DateTime.now(),
);
````

* print log
```dart
exception.print();
```

* throw exception

```dart
throw exception;
```


## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/sonnts996/sample_exception/issues).