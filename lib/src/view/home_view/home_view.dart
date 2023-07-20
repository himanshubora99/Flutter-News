import 'package:flutter/material.dart';
import 'package:news_app/src/providers/bottom_nav_provider.dart';
import 'package:news_app/src/view/feed_view.dart';
import 'package:news_app/src/view/navigation/view/bottom_nav_bar.dart';
import 'package:news_app/src/view/navigation/view/nav_drawer.dart';
import 'package:news_app/src/view/search_page.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedTab =Provider.of<BottomNavProvider>(context).selectedTab;
    print('selectedTab:${selectedTab}');
     return Scaffold(
        appBar: AppBar(
          title: Text('Flutter News'),
          centerTitle: true,
          actions:  [IconButton(
            icon: Icon(Icons.person),
            iconSize: 24,
            onPressed: (){},
          )],
        ),
        drawer: const NavDrawer(),
        body: IndexedStack(
          index: selectedTab,
          children: const [
            FeedView(),
            SearchPage(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: selectedTab,
          onTap: (int val){
            context.read<BottomNavProvider>().setTab(val);
          },
        ),
      );

  }
}