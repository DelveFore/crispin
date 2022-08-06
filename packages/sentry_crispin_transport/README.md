# sentry_crispin_transport

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Sentry Logger for Crispin

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis


Using [Sentry](https://pub.dev/packages/sentry/)

## Features

| [Sentry Level](https://pub.dev/documentation/sentry/latest/sentry_io/SentryLevel-class.html) | Crispin Method |
| :------------------------------------------------------------------------------------------- | :------------- |
| `debug`                                                                                      | `debug`        |
| `info`                                                                                       | `info`         |
| `error`                                                                                      | `error`        |
| `warning`                                                                                    | `warn`         |
| `silly`                                                                                      | `silly`        |

_`silly` level, since it doesn't exist in `Sentry` default levels, we created one use [`fromName`](https://pub.dev/documentation/sentry/latest/sentry_io/SentryLevel/SentryLevel.fromName.html) method._

## Getting started

1. Install `flutter pub add sentry_crispin_transport` or `dart pub add sentry_crispin_transport`
2. Add the transport to Crispin as the below **Usage** section shows

## Usage

```dart
import 'package:crispin/crispin.dart';
import 'package:sentry_crispin_transport/src/sentry_crispin_transport.dart';

void main() {
  Crispin().addTransport(
    SentryCrispinTransport(
      SentryCrispinTransportOptions(level: 'error'),
    ),
  );
}
```

Please see `/example` folder and docs for more examples and please see the docs for more information on usage.

## How To Contribute

1. Create Github issue describing what you'd like to change and use the label [`Sentry Transport`](https://github.com/DelveFore/crispin/labels/Sentry%20Transport) and label either `bug`, `enhancement`, `question`
2. Create your PR with association to the GH Issue (e.g. "closes #4").

## Support

Create Github issue with the label [`Sentry Transport`](https://github.com/DelveFore/crispin/labels/Sentry%20Transport and then either `bug`, `enhancement`, `question`.
