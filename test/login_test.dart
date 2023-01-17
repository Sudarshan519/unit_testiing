import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reqres/app/modules/home/providers/auth_provider.dart';
import 'package:reqres/app/modules/home/repository/data/data_source/rest_client.dart';
import 'package:reqres/main.dart';

void main() {
  late ConfigReader configReader;
  late Dio dio;
  late AuthProvider authProvider;
  setUp(() async {
    // dio = Dio();
    // configReader = ConfigReader();
    // await configReader.init();
    authProvider = AuthProvider("AIzaSyA66yLdTNywMIM8zj2kMldw9y2lOQONSz8");
  });
  group('login', () {
    test('omit email fails', () async {
      // try {
      //   await authProvider.login('', '');
      // } on ServerExeption catch (e) {
      //   expect(e.message, "INVALID_EMAIL");
      // }

      expect(() async => await authProvider.login('', ''),
          throwsA(TypeMatcher<ServerExeption>()));
    });

    test('omit password fails', () async {
      try {
        await authProvider.login('test@gamil.com', '');
      } on ServerExeption catch (e) {
        expect(e.statusCode!, 400);
      } catch (e) {
        print(e.toString());
      }
    });
    test('Can login valid user', () async {
      var res =
          await authProvider.login("bob@stablekernel.com", "foobaraxegrind12%");

      expect(res, TypeMatcher<LoginResponse>());
    });
  });
  group('signup', () {
    test('Can create user', () async {
      var res = await authProvider.signup(
          "bob@stablekernel.com", "foobaraxegrind12%");

      expect(res, TypeMatcher<SignUpResponse>());
    });
    test('Create existing user fails', () async {
      try {
        await authProvider.login("bob@stablekernel.com", "foobaraxegrind12%");
      } on ServerExeption catch (e) {
        expect(e, TypeMatcher<ServerExeption>());
      }
    });
  });
}
