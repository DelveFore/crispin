# crispin

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![melos][melos_badge]][melos_link]

<p style="text-align: center">
  <a href="https://docs.page/delvefore/crispin">Documentation</a> &bull; 
  <a href="https://github.com/DelveFore/crispin/blob/master/packages/crispin/LICENSE">License</a>
</p>

[Crispin](https://docs.page/delvefore/crispin) is a configurable for Dart and Flutter centralizing and streamlining the decision of what specific logger to use and when. This is done through a common interface with the ability to add many [Transports](https://docs.page/delvefore/crispin/transports) as needed. 


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
In the video game Overwatch, the character Winston is voiced by [**_Crispin_** Freeman](https://www.crispinfreeman.com/) 


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
