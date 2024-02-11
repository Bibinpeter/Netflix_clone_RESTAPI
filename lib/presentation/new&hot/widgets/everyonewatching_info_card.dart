import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/home/widget/custom_addbutton.dart';
import 'package:netflixapi/presentation/widgets/videowidget.dart';

class EveryonesWatchingInfoCard extends StatelessWidget {
  const EveryonesWatchingInfoCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.overview,
  });
  final String title;
  final String imageUrl;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoWidget(
            videoImage: imageUrl,
          ),
          Kheight,
            const Row(
          mainAxisAlignment:MainAxisAlignment.end,
          children: [
        CustomAddButton(icon: Icons.ios_share,
         title:"Share",),KWidth,KWidth,
        CustomAddButton(icon: Icons.add, title: "My List"),KWidth,KWidth,
        CustomAddButton(icon: Icons.play_arrow, title: "Play"),KWidth,
        ],
        ),
          Kheight,
          Text(
            title,
            style: const TextStyle(
              fontSize: 18, 
              color: Kwhitecolor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Kheight,
          Text(
            overview,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}