import 'package:flutter/material.dart';
import 'package:news_app/src/models/top_headlines_model.dart';
import 'package:news_app/src/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class RecommendedNewsView extends StatefulWidget {
  const RecommendedNewsView({Key? key}) : super(key: key);

  @override
  State<RecommendedNewsView> createState() => _RecommendedNewsViewState();
}

class _RecommendedNewsViewState extends State<RecommendedNewsView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder:
          (BuildContext context, HomeScreenProvider provider, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Recommendation',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              const SizedBox(height: 4),
              if (provider.articles.isEmpty)
                const SizedBox(
                  height: 500,
                  child: Center(child: Text('No Recommendation found')),
                )
              else
                Container(
                  height: 500,
                  child: ListView.builder(
                      itemCount: provider.articles.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Article articleDetails = provider.articles[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            articleDetails.urlToImage ?? ''),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Container(
                                          width: 15,
                                          height: 15,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green),
                                        ),
                                        Text(articleDetails.author ?? ''),
                                      ],
                                    ),
                                    Text(articleDetails.description ?? ''),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
            ],
          ),
        );
      },
    );
  }
}