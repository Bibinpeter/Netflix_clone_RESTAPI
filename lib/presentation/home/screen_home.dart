import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/home/widget/background_card.dart';
import 'package:netflixapi/presentation/home/widget/number_card.dart';
import 'package:netflixapi/presentation/widgets/main_title.dart';
import 'package:netflixapi/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (BuildContext context, index, _) {
                return NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }
                    return true;
                  },
                  child: Stack(children: [
                    ListView(
                      children: [
                        const BackgroundCard(),
                        const MainTittleCard(
                          title: "Released in the Past Year",
                        ),
                        Kheight,
                        Kheight,
                        const MainTittleCard(
                          title: "Trending Now",
                        ),
                        Kheight,
                        Kheight,
                        //////////////////////////////
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MainTitle(
                              title: "Top 10 TV Shows In India Today ",
                            ),
                            LimitedBox(
                              maxHeight: 250,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.all(5),
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  10,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(
                                        right:
                                            12.0),
                                    child: NumberCard(
                                      index: index,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //////////////////////////////
                        const MainTittleCard(title: "Tense Drama"),
                        Kheight,
                        Kheight,
                        const MainTittleCard(title: "South Indian Mmovies")
                      ],
                    ),
                    scrollNotifier.value==true?   
                    AnimatedContainer(
                      duration:Duration(milliseconds:1000),
                      width: double.infinity,
                      height: 100, 
                      color:KBlackcolor.withOpacity(0.5),
                      child: Column(children: [
                        Row(
                          children: [
                            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwZ05FOAriZHJ30ZN_FPtRje-U-plD4RHurQ&usqp=CAU",
                            width:50,height:70,),
                             const Spacer(),
                                const Icon(Icons.cast,
                                color: Colors.white,),
                               KWidth,
                                Container(
                                  color: Colors.blue,
                                  width: 28,
                                  height: 28, 
                                ),
                                KWidth
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          Text("TV Shows"),
                          Text("Movies"),
                          Text("Categories"),
                        ],)
                      ],),
                    ):Kheight
                  ]),
                );
              })),
    );
  }
}
