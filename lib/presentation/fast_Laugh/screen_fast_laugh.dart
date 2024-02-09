import 'package:flutter/material.dart';
import 'package:netflixapi/presentation/fast_Laugh/widget/video_list_item.dart';

class ScreenFastAndLaugh extends StatelessWidget {
  const ScreenFastAndLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: List.generate(10, (index) {
          return VideoListItem(
            index: index,
          );
        }),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
