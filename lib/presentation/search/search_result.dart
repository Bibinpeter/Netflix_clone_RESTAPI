import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/search/title.dart';
import 'package:netflixapi/presentation/search/widget/screen_searchh.dart';
 

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTile(title: 'Movies & TV'),
        Kheight,
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: searchNotifier,
            builder: (context, snapshot, _) {
              if (snapshot.isEmpty) {
                return const Center(child: Text('No results found'));
              } else if (snapshot.isNotEmpty) {
                return GridView.builder(
                  itemCount: snapshot.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2 / 3, // Adjust aspect ratio as needed
                  ),
                  itemBuilder: (context, index) {
                    final movies = snapshot[index];
                    final image = constants.ImagePath + (movies.poster_path ?? '');
                    return MainMovieCard(image: image);
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}


class MainMovieCard extends StatelessWidget {
  const MainMovieCard({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}