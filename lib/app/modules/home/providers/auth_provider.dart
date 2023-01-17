import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:logger/logger.dart';
import 'package:reqres/app/modules/home/repository/data/data_source/rest_client.dart'; 
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
        print(obj);
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            errResp = res!.data!['error']['message'];
            if (kDebugMode) {
              logger.e(
                  "Got error : ${res.statusCode} -> ${res.data['error']['message']}");
            }
            throw ServerExeption(message: errResp.toString(), statusCode: 400);

          default:
            print(obj);
            break;
        }
      });

      return res;
    } catch (e) {
      print(e.toString());
      throw ServerExeption(message: errResp.toString(), statusCode: 400);
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
        print(obj);
        final res = (obj as DioError).response;
        print(res);
        errResp = res!.data!['error']['message'];
        switch (obj.runtimeType) {
          case DioError:
            if (kDebugMode) {
              logger.e(
                  "Got error : ${res.statusCode} -> ${res.data['error']['message']}");
            }
            throw ServerExeption(
                message: errResp.toString(), statusCode: res.statusCode);

          default:
            throw ServerExeption(
                message: errResp.toString(), statusCode: res.statusCode);
        }
      });

      return res;
    } catch (e) {
      throw ServerExeption(message: errResp.toString(), statusCode: 400);
    }
  }
}

class ServerExeption implements Exception {
  final String message;
  final int? statusCode;

  ServerExeption({required this.message, this.statusCode});
}
