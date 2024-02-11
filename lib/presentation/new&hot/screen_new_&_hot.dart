// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/new&hot/widgets/coming_soon.dart';
import 'package:netflixapi/presentation/new&hot/widgets/everyoneswatching.dart';
import '../../core/colors/colors.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(95),
            child: AppBar(
              title: const Text(
                "New &  Hot",
                style: TextStyle(
                  fontSize: 30,
                  color: Kwhitecolor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
              KWidth,
                SizedBox(
                  height: 60 ,
                  width: 50,
                  child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4qo_pLvLYfs9X-Ej51KnDgeVH7UjLKm_4Cw&usqp=CAU"),
                ),
                KWidth,
              ],
              bottom: TabBar(
                  unselectedLabelColor: Kwhitecolor,
                  labelColor: KBlackcolor,
                  isScrollable: true,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    color: Kwhitecolor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  tabs: const [
                    Tab(
                      text: "   🍿Coming Soon   ",
                    ),
                    Tab(
                      text: "  🔥Everyone's watching  ",
                    )
                  ]),
            )),
        body: TabBarView(children: [
          buildComingSoon(),
          buildEveryonesWatching(),
        ]),
      ),
    );
  }

  Widget buildComingSoon() {
    return const ComingSoonWidget();
  }

  buildEveryonesWatching() {
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        
        Expanded(child: EveryonesWatchingWidget()),
      ],
    );
  }
}