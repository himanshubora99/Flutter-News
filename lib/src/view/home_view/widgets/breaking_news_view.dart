import 'package:flutter/material.dart';
import 'package:news_app/src/models/top_headlines_model.dart';
import 'package:news_app/src/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class BreakingNewsView extends StatefulWidget {
  const BreakingNewsView({Key? key}) : super(key: key);

  @override
  State<BreakingNewsView> createState() => _BreakingNewsViewState();
}

class _BreakingNewsViewState extends State<BreakingNewsView> {
  PageController _pageController = PageController(
    viewportFraction: 0.8,
  );

  @override
  void initState() {
    super.initState();
    List<Article> articles = context.read<HomeScreenProvider>().articles;
    _pageController = PageController(
      initialPage: articles.length * 10,
      // A large initial page number for looping effect
      viewportFraction: 0.8,
    );
  }


  @override
  void didUpdateWidget(covariant BreakingNewsView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (BuildContext context, HomeScreenProvider provider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Breaking News',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
            ),
            if (provider.articles.isEmpty)
              const SizedBox(
                  height: 180.0,
                  child: Center(child: Text('No Breaking News Available')))
            else
              SizedBox(
                height: 180.0,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: provider.articles.length * 200,
                  itemBuilder: (BuildContext context, int index) {
                    final Article articleDetails =
                    provider.articles[index % provider.articles.length];
                    return AnimatedBuilder(
                        animation: _pageController,
                        builder: (BuildContext context, Widget? child) {
                          double value = 1;
                          if (_pageController.position.haveDimensions) {
                            value = _pageController.page! - index;
                            value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
                          }
                          return Center(
                            child: SizedBox(
                              height: Curves.easeInOut.transform(value) * 170,
                              width: Curves.easeInOut.transform(value) * 300,
                              child: child,
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      articleDetails.urlToImage ?? ''),
                                  fit: BoxFit.fill)),
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(articleDetails.source?.name ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.white)),
                              Text(articleDetails.description ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white)),
                            ],
                          ),
                        ));
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}