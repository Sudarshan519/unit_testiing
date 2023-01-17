// import 'dart:convert';

// import 'package:bnpj_credit/core/errors/exceptions.dart';
// import 'package:http/http.dart' as http;

// import 'package:injectable/injectable.dart';

// abstract class HttpClient {
//   Future<T?> get<T>({
//     required String url,
//     required T Function(String) convertResponseToModel,
//     Map<String, String>? headers,
//   });

//   Future<T?> post<T>({
//     required String url,
//     required T Function(String) convertResponseToModel,
//     Map<String, String>? headers,
//     Object? body,
//     Encoding? encoding,
//   });
// }

// @LazySingleton(as: HttpClient)
// class HttpClientImpl implements HttpClient {
//   final http.Client _client;
//   HttpClientImpl(this._client);

//   @override
//   Future<T?> get<T>({
//     required String url,
//     required T Function(String) convertResponseToModel,
//     Map<String, String>? headers,
//   }) async {
//     http.Response response;
//     try {
//       response = await _client.get(
//         Uri.parse(url),
//         headers: headers,
//       );
//     } catch (ex) {
//       throw FatalException(message: ex.toString());
//     }
//     return _request(
//       response: response,
//       convertResponseToModel: convertResponseToModel,
//     );
//   }

//   @override
//   Future<T?> post<T>({
//     required String url,
//     required T Function(String) convertResponseToModel,
//     Map<String, String>? headers,
//     Object? body,
//     Encoding? encoding,
//   }) async {
//     http.Response response;
//     try {
//       response = await _client.post(
//         Uri.parse(url),
//         headers: headers,
//         body: body,
//         encoding: encoding,
//       );
//     } catch (ex) {
//       throw FatalException(message: ex.toString());
//     }
//     return _request(
//       response: response,
//       convertResponseToModel: convertResponseToModel,
//     );
//   }

//   Future<T?> _request<T>({
//     required http.Response response,
//     required T Function(String) convertResponseToModel,
//   }) async {
//     if (response.statusCode == 200) {
//       try {
//         return convertResponseToModel(response.body);
//       } catch (ex) {
//         throw FatalException(message: ex.toString());
//       }
//     } else {
//       try {
//         final responseBody =
//             json.decode(response.body) as Map<String, dynamic>?;
//         throw FatalException(
//             message: (responseBody?["error"] as String?) ??
//                 "Something went wrong please try again later");
//       } catch (ex) {
//         throw ServerException(
//             message: "Something went wrong please try again later");
//       }
//     }
//   }
// }
