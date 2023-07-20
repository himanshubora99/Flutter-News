import 'package:flutter/material.dart';

import 'package:news_app/src/models/top_headlines_model.dart';
import 'package:news_app/src/services/services.dart';

class HomeScreenProvider extends ChangeNotifier {
  bool isLoading =false;

  void setLoading(bool val){
    isLoading =val;
    notifyListeners();
  }

  List<Article> articles = <Article>[];

  Future<void> getTopHeadlines() async {
    final TopHeadlineModel? val = await ApiDataSource().getTopHeadlines();
    if (val != null) {
      articles = List<Article>.from(val.articles ?? <Article>[]);
    }
  }
}
