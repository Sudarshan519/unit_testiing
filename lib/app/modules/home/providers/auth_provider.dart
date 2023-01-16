import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:logger/logger.dart';
import 'package:reqres/app/modules/home/repository/data_source/rest_client.dart';
import 'package:reqres/main.dart';

class AuthProvider {
  final RestClient restClient = RestClient(Dio());
  final logger = Logger();
  final String apiKey;

  AuthProvider(this.apiKey);
  // final ConfigReader configReader = getx.Get.find();
  Future<SignUpResponse> signup(String email, String password) async {
    var res;
    var errResp;
    final Map<String, dynamic> loginData = {
      "email": email,
      "password": password
    };
    try {
      var res = await restClient.signup(apiKey, loginData).catchError((obj) {
        final res = (obj as DioError).response;
        errResp = res!.data!['error']['message'];
        switch (obj.runtimeType) {
          case DioError:
            if (kDebugMode) {
              logger.e(
                  "Got error : ${res.statusCode} -> ${res.data['error']['message']}");
            }
            break;
          default:
            break;
        }
      });

      return res;
    } catch (e) {
      throw ServerExeption(message: errResp.toString());
    }
  }

  Future<LoginResponse> login(String email, String password) async {
    final Map<String, dynamic> loginData = {
      "email": email,
      "password": password
    };
    var errResp;
    try {
      var res = await restClient.signin(apiKey, loginData).catchError((obj) {
        final res = (obj as DioError).response;
        errResp = res!.data!['error']['message'];
        switch (obj.runtimeType) {
          case DioError:
            if (kDebugMode) {
              logger.e(
                  "Got error : ${res.statusCode} -> ${res.data['error']['message']}");
            }
            break;
          default:
            break;
        }
      });

      return res;
    } catch (e) {
      throw ServerExeption(message: errResp.toString());
    }
  }
}

class ServerExeption implements Exception {
  final String message;
  final int? statusCode;

  ServerExeption({required this.message, this.statusCode});
}
