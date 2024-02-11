import 'package:flutter/material.dart';
import 'package:netflixapi/api/api.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/models/movie.dart';
import 'package:netflixapi/presentation/fast_Laugh/widget/video_list_item.dart';

ValueNotifier<List<Movie>> videoImageNotifier = ValueNotifier([]);

class ScreenFastLaugh extends StatefulWidget {
  const ScreenFastLaugh({super.key});

  @override
  State<ScreenFastLaugh> createState() => _ScreenFastLaughState();
}

class _ScreenFastLaughState extends State<ScreenFastLaugh> {
  @override
  void initState() {
    getImages();
    super.initState();
  }

  void getImages() async {
    videoImageNotifier.value = await Api().gethorror();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: videoImageNotifier,
        builder: (context, snapshot, _) {
          if (snapshot.isEmpty) {
            return const Text('Error');
          } else if (snapshot.isNotEmpty) {
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.length,
              itemBuilder: (context, index) {
                final movie = snapshot[index];
                final movieImage =
                    constants.ImagePath + (movie.poster_path?? '');
                return VideoListItem(index: index, imageurl: movieImage);
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }
}




// PageView(
//       scrollDirection: Axis.vertical,
//       children: List.generate(10, (index) => VideoListItem(index: index)),
//     )