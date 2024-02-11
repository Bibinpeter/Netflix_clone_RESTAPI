import 'package:flutter/material.dart';
import 'package:netflixapi/api/api.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/models/movie.dart';
import 'package:netflixapi/presentation/new&hot/widgets/coming_soon_info_card.dart';


ValueNotifier<List<Movie>> comingSoonMovieNotifier = ValueNotifier([]);

class ComingSoonWidget extends StatefulWidget {
  const ComingSoonWidget({Key? key}) : super(key: key);

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  @override
  void initState() {
    fetchmovies();
    super.initState();
  }

  void fetchmovies() async {
    comingSoonMovieNotifier.value = await Api().getupcomingmovies();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: comingSoonMovieNotifier,
      builder: (context, snapshot, _) {
        if (snapshot.isEmpty) {
          return (const Text('error'));
        } else if (snapshot.isNotEmpty) {
          return Expanded(
              child: ListView.separated(
            itemCount: snapshot.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) {
              final movie = snapshot[index];
              final imageurl =
                  constants.ImagePath+ (movie.backdrop_path ?? '');
              final releaseDate = movie.release_date?? '';
              final overview = movie.overview ?? '';
              final orignalTitle = movie.original_title?? '';
              return ComingSoonInfoCard(
                  releaseDate: releaseDate,
                  originalTitle: orignalTitle,
                  overview: overview,
                  imageUrl: imageurl);
            },
          ));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}