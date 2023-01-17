import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

var params = {"key": "AIzaSyA66yLdTNywMIM8zj2kMldw9y2lOQONSz8"};

@RestApi(baseUrl: "https://identitytoolkit.googleapis.com/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/accounts:signUp')
  Future<SignUpResponse> signup(
      @Query("key") String apiKey, @Body() Map<String, dynamic> bodyParams);

  @POST('/accounts:signInWithPassword')
  Future<LoginResponse> signin(
      @Query("key") String apiKey, @Body() Map<String, dynamic> bodyParams);
}

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "error")
  Error? error;
  @JsonKey(name: 'idToken')
  String? idToken;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: "expiresIn")
  int? expiresIn;
  @JsonKey(name: "displayName")
  String? displayName;
  @JsonKey(name: 'refresh_token')
  String? refresh_token;
  @JsonKey(name: "localId")
  String? localId;

  LoginResponse(this.displayName, this.email, this.expiresIn,
      this.refresh_token, this.idToken, this.localId, this.error);
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class SignUpResponse {
  @JsonKey(name: "error")
  Error? error;
  @JsonKey(name: 'idToken')
  String? idToken;

  @JsonKey(name: 'refresh_token')
  String? refresh_token;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: "expiresIn")
  String? expiresIn;

  @JsonKey(name: "localId")
  String? localId;

  SignUpResponse(this.error, this.idToken, this.refresh_token, this.email,
      this.expiresIn, this.localId);

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}

@JsonSerializable()
class Task {
  String? id;
  String? name;
  String? avatar;
  String? createdAt;

  Task({this.id, this.name, this.avatar, this.createdAt});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

@JsonSerializable()
class Error {
  @JsonKey(name: 'code')
  int statusCode;
  @JsonKey(name: 'message')
  String message;

  Error(this.statusCode, this.message);
  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
