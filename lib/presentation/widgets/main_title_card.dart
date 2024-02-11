import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/widgets/main_homecard.dart';
import 'package:netflixapi/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  final Future<List<dynamic>> movies;

  const MainTitleCard({
    Key? key,
    required this.title,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: MainTitle(title: title),
        ),
        FutureBuilder(
          future: movies,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return LimitedBox(
                maxHeight: 200,
                child: ListView(

                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    
                    snapshot.data!.length,
                    (index) {
                      final movie = snapshot.data![index];
                      final imageUrl =
                          constants.ImagePath + (movie.poster_path?? '');
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MainCardHome(image:imageUrl),
                      );
                    },
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        Kheight,
      ],
    );
  }
}