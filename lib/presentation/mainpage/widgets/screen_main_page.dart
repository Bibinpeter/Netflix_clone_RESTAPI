import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/presentation/downloads/screen_downloads.dart';
import 'package:netflixapi/presentation/fast_Laugh/screen_fast_laugh.dart';
import 'package:netflixapi/presentation/home/screen_home.dart';
import 'package:netflixapi/presentation/mainpage/widgets/bottom_nav.dart';
import 'package:netflixapi/presentation/new&hot/screen_new_&_hot.dart';
import 'package:netflixapi/presentation/search/widget/screen_searchh.dart';


class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});

final _pages=[
   ScreenHome(),
  ScreenNewAndHot(),
  ScreenFastAndLaugh(),
  ScreenSearch(),
  ScreenDownloads(),
];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundcolor,
      body:ValueListenableBuilder(valueListenable: indexChangeNotifier,
       builder: (context, int index, child) {
        return _pages[index];
      },),
        bottomNavigationBar:  const BottomNavigationWidgets(),

    );
  }
}
