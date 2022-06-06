# crispin

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![melos][melos_badge]][melos_link]

Crispin Logger for Dart and Flutter


```dart
void main() {
  Crispin().addTransport(LocalLoggerTransport('error'));
  FlutterError.onError = (FlutterErrorDetails details) {
    CrispinLogger().error('Flutter Error', error: details.exception, stackTrace: details.stack);
  };
}
```

## Inspiration
Heavily inspired by the fantastic [WinstonJS](https://github.com/winstonjs/winston) project!
Thus, the name of this project is a nod to the Winston project by way of another reference. 
In the video game OverWatch the character Winston is voiced by Crispin Freeman. 


## README Badge

Using Crispin? Add a README badge to show it off:

[![crispin](https://img.shields.io/badge/uses%20-crispin-33AEE7.svg?style=flat-square)](https://github.com/delvefore/crispin)

```markdown
[![crispin](https://img.shields.io/badge/uses%20-crispin-33AEE7.svg?style=flat-square)](https://github.com/delvefore/crispin)
```

---

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[melos_badge]: https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square
[melos_link]: https://github.com/invertase/melos
