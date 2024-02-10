// ignore: file_names
import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/home/widget/custom_addbutton.dart';
import 'package:netflixapi/presentation/new&hot/widgets/coming_soon.dart';
import 'package:netflixapi/presentation/new&hot/widgets/everyoneswatching.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: KBlackcolor,
            title: const Text(
              "New & Hot",
              style: TextStyle(
                  color: Kwhitecolor,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
              ),
              KWidth,
              Container(
                color: Colors.blue,
                width: 28,
                height: 28,
              ),
              KWidth,
            ],
            bottom: TabBar(
              unselectedLabelColor: Kwhitecolor,
              labelColor: KBlackcolor,
              indicator: BoxDecoration(
                  color: Kwhitecolor, borderRadius: BorderRadius.circular(20)),
              tabs: const [
                Tab(
                  text: "   🍿Coming Soon   ",
                ),
                Tab(
                  text: "   👀 Everyone watching   ",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryOneWathing(),
          ],
        ),
      ),
    );
  }
////////// TAB 1 FN
  Widget _buildComingSoon() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => const Comingsoon(),
    );
  }
///////// TAB 2 FN
  Widget _buildEveryOneWathing() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => const EveryonesWatchingwidget(),
    );
  }
}

