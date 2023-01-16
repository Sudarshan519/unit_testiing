import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reqres/app/modules/home/providers/auth_provider.dart';
import 'package:reqres/main.dart';

void main() {
  group('login', () {
    late ConfigReader configReader;
    late Dio dio;
    late AuthProvider authProvider;
    setUp(() async {
      dio = Dio();
      authProvider = AuthProvider("AIzaSyA66yLdTNywMIM8zj2kMldw9y2lOQONSz8");
    });
    test('testing with empty email and password', () async {
      try {
        var res = await authProvider.login('', '');
      } on ServerExeption catch (e) {
        expect(e.message, "INVALID_EMAIL");
      }
    });

    test('valid username and password returns valid user object', () async {});
  });
  group('signup', () {});
}
