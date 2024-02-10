import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixapi/api/api.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/models/movie.dart';
import 'package:netflixapi/presentation/home/widget/background_card.dart';
import 'package:netflixapi/presentation/home/widget/number_card.dart';
import 'package:netflixapi/presentation/widgets/main_title.dart';
import 'package:netflixapi/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class ScreenHome extends StatefulWidget {
  const ScreenHome({
    super.key,
  });

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
 
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> airingTodayMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> horrorMovies;

  @override
  void initState() {
    trendingMovies = Api().getTrending();
    topRatedMovies = Api().gettopRated();
    airingTodayMovies = Api().getairingToday();
    upcomingMovies = Api().getupcoming();
    horrorMovies = Api().gethorror();
    super.initState();
  }

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
                        MainTitleCard(title: "Releasing Today", movies: trendingMovies),
                        Kheight,
                        Kheight,
                       MainTitleCard(title: "Released Now", movies: topRatedMovies),
                        Kheight,
                        Kheight,
                        //////////////////////////////
Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: MainTitle(title: 'Popular Movies'),
        ),
        FutureBuilder(
          future: airingTodayMovies,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('error:${snapshot.error}');
            } else if (snapshot.hasData) {
              return LimitedBox(
                maxHeight: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) {
                      final movie = snapshot.data![index];
                      final image =
                          constants.ImagePath + (movie.poster_path??"");
                      return NumberCard(index: index, image: image);
                    },
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        Kheight
      ],
    ),
                        //////////////////////////////
                        MainTitleCard(title: "Top Rated Movies", movies: upcomingMovies),
                        Kheight,
                        Kheight,
                       MainTitleCard(title: "Horror Movies", movies:horrorMovies),
                      ],
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 100,
                            color: KBlackcolor.withOpacity(0.5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwZ05FOAriZHJ30ZN_FPtRje-U-plD4RHurQ&usqp=CAU",
                                      width: 50,
                                      height: 70,
                                    ),
                                    const Spacer(),
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
                                    KWidth
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("TV Shows"),
                                    Text("Movies"),
                                    Text("Categories"),
                                  ],
                                )
                              ],
                            ),
                          )
                        : Kheight
                  ]),
                );
              })),
    );
  }
}
