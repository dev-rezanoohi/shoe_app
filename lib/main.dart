import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/Provider/shoe_size_provider.dart';
import 'package:shoe_app/Provider/topic_top_bar_provider.dart';
import 'Theme/app_theme.dart';
import 'View/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TopicProvider(),),
        ChangeNotifierProvider(create: (context) => ShoeSizeProvider(),)
      ],
      child: GetMaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
