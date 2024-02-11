import 'package:flutter/material.dart';
import 'package:netflixapi/api/api.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/models/movie.dart';
import 'package:netflixapi/presentation/new&hot/widgets/everyonewatching_info_card.dart';
 

ValueNotifier<List<Movie>> everyonesWatchingNotifier = ValueNotifier([]);

class EveryonesWatchingWidget extends StatefulWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<EveryonesWatchingWidget> createState() =>
      _EveryonesWatchingWidgetState();
}

class _EveryonesWatchingWidgetState extends State<EveryonesWatchingWidget> {
  @override
  void initState() {
    fetchmovies();
    super.initState();
  }

  void fetchmovies() async {
    everyonesWatchingNotifier.value = await  Api().everyonesWatchingMovie();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: everyonesWatchingNotifier,
      builder: (context, snapshot, _) {
        if (snapshot.isEmpty) {
          return const Text('data not found');
        } else if (snapshot.isNotEmpty) {
          return Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final movie = snapshot[index];
                    final image =
                        constants.ImagePath+ (movie.backdrop_path?? '');
                    return EveryonesWatchingInfoCard(
                        imageUrl: image,
                        overview: movie.overview ?? '',
                        title: movie.original_title?? 'cfhdn fn  rsdhsrhdfh');
                  },
                 
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 30,
                      ),
                  itemCount: snapshot.length),
                  );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}