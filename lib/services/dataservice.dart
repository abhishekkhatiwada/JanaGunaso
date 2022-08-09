import 'package:dio/dio.dart';
import 'package:gunaso/models/form_model.dart';
import 'package:gunaso/models/user_model.dart';
var token = '2|jTwvAAY0GHLd88wJ1xDTlxaVURyXUVV0r6WoIr7e';
class DataService {
  static Future<List<GunasoData>> getGunaso() async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'http://demo.digitalpalika.org/api/gunaso',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json'
        }),
      );
      //print(response.data);
      final data = (response.data['data'] as List).map((e) =>
          GunasoData.fromJson(e)).toList();
      return data;
    } on DioError catch (err) {
      //print(err);
      return [];
    }
  }

  static Future<List<UserData>> getUserData() async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'http://demo.digitalpalika.org/api/gunaso',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json'
        }),
      );
      final data = (response.data['data'] as List).map((e) =>
          UserData.fromJson(e)).toList();
      return data;
    } on DioError catch (err) {
      //print(err);
      return [];
    }
  }
}