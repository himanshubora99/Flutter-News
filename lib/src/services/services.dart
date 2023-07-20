import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:news_app/src/config/config.dart';
import 'package:news_app/src/models/top_headlines_model.dart';
import 'package:http/http.dart' as http;

class ApiDataSource {
  static final ApiDataSource _singleton = ApiDataSource._internal();

  factory ApiDataSource() {
    return _singleton;
  }

  ApiDataSource._internal();

  final Map<String, String> _header = <String, String>{
    'accept': 'application/json',
    'content-type': 'application/json',
    // 'Authorization': authorization ?? "",
  };

  Future<TopHeadlineModel?> getTopHeadlines() async {
    try {
      final http.Response response = await http.get(
        Uri.parse(AppConfig.topHeadlinesApiUrl),
        headers: _header,
      );
      TopHeadlineModel topHeadlineModel =
          TopHeadlineModel.fromMap(jsonDecode(response.body));
      if (kDebugMode) {
        print(
            'getTopHeadlines Data : 22 working:${topHeadlineModel.articles?.length}||response code:${response.statusCode}');
      }
      return topHeadlineModel;
    } on Exception catch (e) {
      if (kDebugMode) {
        print('getTopHeadlines Error:${e.toString()}');
      }
      return null;
    }
  }
}
