import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/search/title.dart';

class SearchIdleWidget extends StatelessWidget {
  final Future<List<dynamic>>? movie;
  const SearchIdleWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SearchTextTile(title: 'Top Searches'),
      Kheight,
      FutureBuilder(
        future: movie,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('error is :${snapshot.error}');
          } else if (snapshot.hasData) {
            return Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final movie = snapshot.data![index];
                    final image =
                        constants.ImagePath + (movie.backdrop_path ?? "");

                    final titleOfMovie = (movie.original_title ?? "coming..");

                    print(image);
                    print(titleOfMovie);

                    return TopSearchMovieTile(
                        imageUrl: image, title: titleOfMovie );
                  },
                  separatorBuilder: (context, index) => Kheight,
                  itemCount: snapshot.data!.length),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )
    ]);
  }
}

class TopSearchMovieTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  const TopSearchMovieTile(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        KWidth,
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
              color: Kwhitecolor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: Kwhitecolor,
          radius: 23,
          child: CircleAvatar(
            backgroundColor: KBlackcolor,
            radius: 20,
            child: Icon(
              CupertinoIcons.play_fill,
              color: Kwhitecolor,
            ),
          ),
        )
      ],
    );
  }
}
