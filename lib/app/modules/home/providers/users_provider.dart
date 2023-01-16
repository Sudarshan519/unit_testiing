import 'package:get/get.dart';

import '../users_model.dart';

class UsersProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://reqres.in/api/';
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return UsersResponse.fromJson(map);
      if (map is List)
        return map.map((item) => UsersResponse.fromJson(item)).toList();
    };
  }

  Future<UsersResponse?> getUsers({id = ""}) async {
    final response = await get('users/$id');
    return response.body;
  }

  Future<Response<UsersResponse>> postUsers(UsersResponse users) async =>
      await post('users', users);
  Future<Response> deleteUsers(int id) async => await delete('users/$id');
}
