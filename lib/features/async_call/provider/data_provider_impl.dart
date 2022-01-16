import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:boost_grade_start/features/async_call/model/photo_model.dart';
import 'package:boost_grade_start/features/async_call/provider/data_provider.dart';

class DataProviderImpl implements DataProvider {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<PhotoModel>?> getPhotos() async {
    final response = await http.get(Uri.parse(_baseUrl + '/photos'));
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List<dynamic>;
      return list.map((e) => PhotoModel.fromJson(e)).toList();
    } else {
      throw Exception(
        'Network error: ${response.statusCode} ${response.reasonPhrase}',
      );
    }
  }
}
