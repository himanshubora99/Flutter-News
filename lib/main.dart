import 'package:flutter/material.dart';
import 'package:news_app/src/providers/bottom_nav_provider.dart';
import 'package:news_app/src/providers/home_screen_provider.dart';
import 'package:news_app/src/routes/routes.dart';
import 'package:news_app/src/utils/custom_scroll_behavior.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<BottomNavProvider>(
            create: (_) => BottomNavProvider()),
        ChangeNotifierProvider<HomeScreenProvider>(
            create: (_) => HomeScreenProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter News',
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        onGenerateRoute: Routers.generateRoute,
      ),
    );
  }
}
