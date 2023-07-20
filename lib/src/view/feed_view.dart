import 'package:flutter/material.dart';
import 'package:news_app/src/providers/home_screen_provider.dart';
import 'package:news_app/src/view/home_view/widgets/breaking_news_view.dart';
import 'package:news_app/src/view/home_view/widgets/recommendation_news_view.dart';
import 'package:provider/provider.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  void initState() {
    HomeScreenProvider initPro = Provider.of(context, listen: false);
    initPro.isLoading = true;
    initPro.getTopHeadlines().then((value) {
      initPro.setLoading(false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeScreenProvider homeProvider = Provider.of(context);
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () async {
            homeProvider.setLoading(true);
            await homeProvider.getTopHeadlines().then((value) {
              homeProvider.setLoading(false);
            });
          },
          child: (homeProvider.isLoading && homeProvider.articles.isEmpty) // don't want to show unnecessary loading if previous data is ther
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    BreakingNewsView(),
                    RecommendedNewsView(),
                  ],
                )),
    );
  }
}
