import 'package:get/get.dart';

import '../cases_model.dart';

class CasesProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Cases.fromJson(map);
      if (map is List) return map.map((item) => Cases.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://api.covid19api.com/';
  }

  Future<Cases?> getCases(int id) async {
    final response = await get('cases/$id');
    return response.body;
  }

  Future<Response<Cases>> postCases(Cases cases) async =>
      await post('cases', cases);
  Future<Response> deleteCases(int id) async => await delete('cases/$id');
}
