
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gunaso/services/dataservice.dart';

final formProvider = Provider.autoDispose((ref)=> FormProvider());
class FormProvider{
  Future<String> formData({required String title, required String description }) async{
    final dio = Dio();
    try{
      final response = await dio.post(
        'http://demo.digitalpalika.org/api/gunaso',
        data: {
          'title': title,
          'description': description,
        },
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json'
        }),

      );
      return 'success';
    } on DioError catch(err){
      return '${err.message}';
    }

  }
}