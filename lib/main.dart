import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/presentation/mainpage/widgets/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: KBlackcolor),
        scaffoldBackgroundColor: backgroundcolor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          // ignore: deprecated_member_use
          bodyText1: TextStyle(color: Colors.white),
           // ignore: deprecated_member_use
           bodyText2: TextStyle(color: Colors.white),
           
        )
      ),
      home: ScreenMainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
