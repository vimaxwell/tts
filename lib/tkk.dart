import 'dart:async';
import 'dart:math';
import 'package:http/http.dart' as http;

class TKK {
  static const int MIM = 60 * 60 * 1000;
  static const String ELEMENT_URL_PATH = "/translate_a/element.js";

  static final log = Logger<TKK>();

  static final tkkPattern = RegExp("tkk='(\\d+).(-?\\d+)'");

  static Pair<int, int>? innerValue;
  static final lock = Completer<void>();

  static Future<Pair<int, int>> get value async {
    return await update() ?? generate();
  }

  static Future<Pair<int, int>?> update() async {
    final now = DateTime.now().millisecondsSinceEpoch ~/ MIM;
    if (innerValue != null && innerValue!.first == now) {
      return innerValue;
    }

    final newTKK = await updateFromGoogle();

    final oldTKK = innerValue;
    if (oldTKK == null || (newTKK != null && newTKK.first >= oldTKK.first)) {
      innerValue = newTKK;
    }

    return innerValue;
  }

  static Pair<int, int> generate() {
    final now = DateTime.now().millisecondsSinceEpoch ~/ MIM;
    final generator = Random();
    return Pair(now, generator.nextInt(1 << 32) + generator.nextInt(1 << 32));
  }

  static Future<Pair<int, int>?> updateFromGoogle() async {
    try {
      final tkk = await fetchTKK(googleApiServerUrl);
      log.i("TKK Updated: ${tkk.first}.${tkk.second}");
      return tkk;
    } catch (error) {
      log.w("TKK update failed", error);
      return null;
    }
  }

  static Future<Pair<int, int>> fetchTKK(
      [String serverUrl = googleApiServerUrl]) async {
    final elementJS = await getElementJsRequest(serverUrl).readString(null);
    final matcher = tkkPattern.firstMatch(elementJS);

    if (matcher == null) {
      throw StateError("TKK not found.");
    }

    final value1 = int.parse(matcher.group(1)!);
    final value2 = int.parse(matcher.group(2)!);

    return Pair(value1, value2);
  }

  static RequestBuilder getElementJsRequest(String serverUrl) {
    return RequestBuilder("$serverUrl$ELEMENT_URL_PATH")
        .userAgent()
        .googleReferer()
        // .connectTimeout(5000)
        .throwStatusCodeException(true);
  }

  static Future<bool> testConnection() async {
    try {
      await getElementJsRequest(googleApiServerUrl).tryConnect();
      log.i("TKK connection test: OK");
      return true;
    } catch (e) {
      log.i("TKK connection test: FAILURE");
      return false;
    }
  }
}

class Pair<A, B> {
  final A first;
  final B second;

  Pair(this.first, this.second);
}

class Logger<T> {
  void i(String message, [Object? error]) {
    print('INFO: $message');
    if (error != null) {
      print(error);
    }
  }

  void w(String message, [Object? error]) {
    print('WARNING: $message');
    if (error != null) {
      print(error);
    }
  }
}

class RequestBuilder {
  final String url;
  late http.Request _request;

  RequestBuilder(this.url) {
    _request = http.Request('GET', Uri.parse(url));
  }

  RequestBuilder userAgent() {
    // Set user agent header
    _request.headers['User-Agent'] = 'Your User Agent';
    return this;
  }

  RequestBuilder googleReferer() {
    // Set Google referer header
    _request.headers['Referer'] = 'https://www.google.com/';
    return this;
  }

  // RequestBuilder connectTimeout(int milliseconds) {
  //   // Set connect timeout
  //   _request.timeout = Duration(milliseconds: milliseconds);
  //   return this;
  // }

  RequestBuilder throwStatusCodeException(bool value) {
    // Set throw status code exception flag
    return this;
  }

  Future<String> readString(Object? options) async {
    final response = await http.read(Uri.parse(url));
    return response.toString();
  }

  Future<void> tryConnect() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw StateError('Failed to connect to the server.');
    }
  }
}

const String googleApiServerUrl = 'https://translate.googleapis.com';
