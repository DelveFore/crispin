# crispin

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Crispin Logger for Dart and Flutter


```dart
void main() {
  Crispin().addTransport(CrispinLocalLoggerTransport());
  FlutterError.onError = (FlutterErrorDetails details) {
    CrispinLogger().error('Flutter Error', error: details.exception, stackTrace: details.stack);
  };
}
```

Heavily inspired by the fantastic WinstonJS project! Thus, the name of this project is a nod to Winston. 
In the video game OverWatch the character Winston is voiced by Crispin Freeman. 


[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
