import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/new&hot/widgets/coming_soon.dart';

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
        body: TabBarView(children: [
          _buildComingSoon(),
          _buildEveryOneWathing(),
        ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 10, 
      itemBuilder:(context, index)=>const Comingsoon(),
    
    );
     
    
  }

  Widget _buildEveryOneWathing() {
    return SizedBox();
  }
}

