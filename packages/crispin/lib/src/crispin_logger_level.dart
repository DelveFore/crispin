// Logging levels conform to the severity ordering specified by
// [RFC5424]: _severity of all levels is assumed to be numerically **ascending**
// from most important to least important._
class CrispinLoggerLevel {
  static int error = 0;
  static int warn = 1;
  static int info = 2;
  static int http = 3;
  static int verbose = 4;
  static int debug = 5;
  static int silly = 6;

  static bool isValidName(String value) {
    return CrispinLoggerLevel.getFromName(value) > -1;
  }

  static int getFromName(String value) {
    switch (value.toLowerCase()) {
      case 'error':
        return CrispinLoggerLevel.error;
      case 'warn':
        return CrispinLoggerLevel.warn;
      case 'info':
        return CrispinLoggerLevel.info;
      case 'http':
        return CrispinLoggerLevel.http;
      case 'verbose':
        return CrispinLoggerLevel.verbose;
      case 'debug':
        return CrispinLoggerLevel.debug;
      case 'silly':
        return CrispinLoggerLevel.silly;
    }
    return -1; // no match so not one
  }
}
