import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStore {
  static final SecureStore _singleton = SecureStore._internal();

  final flutterSecureStorage = new FlutterSecureStorage();

  factory SecureStore() {
    return _singleton;
  }

  FlutterSecureStorage get secureStore => this.flutterSecureStorage;

  SecureStore._internal();
}