// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['displayName'] as String?,
      json['email'] as String?,
      json['expiresIn'] as int?,
      json['refresh_token'] as String?,
      json['idToken'] as String?,
      json['localId'] as String?,
      json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'idToken': instance.idToken,
      'email': instance.email,
      'expiresIn': instance.expiresIn,
      'displayName': instance.displayName,
      'refresh_token': instance.refresh_token,
      'localId': instance.localId,
    };

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
      json['idToken'] as String?,
      json['refresh_token'] as String?,
      json['email'] as String?,
      json['expiresIn'] as String?,
      json['localId'] as String?,
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'idToken': instance.idToken,
      'refresh_token': instance.refresh_token,
      'email': instance.email,
      'expiresIn': instance.expiresIn,
      'localId': instance.localId,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      json['code'] as int,
      json['message'] as String,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.statusCode,
      'message': instance.message,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://identitytoolkit.googleapis.com/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SignUpResponse> signup(apiKey, bodyParams) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'key': apiKey};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(bodyParams);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SignUpResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/accounts:signUp',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignUpResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginResponse> signin(apiKey, bodyParams) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'key': apiKey};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(bodyParams);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/accounts:signInWithPassword',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
