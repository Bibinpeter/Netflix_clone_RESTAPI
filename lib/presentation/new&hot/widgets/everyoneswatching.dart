import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/widgets/videowidget.dart';

import '../../home/widget/custom_addbutton.dart';

class EveryonesWatchingwidget extends StatelessWidget {
  const EveryonesWatchingwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Kheight,
        Text(
          'Kunfu Panda',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        Text(
          "This hit silcon follows the merry misadventures of six\n20 - something pals as they navigate the pitfalls of\nwork,life and love in 1990's Manhattan.",
          style: TextStyle(color: Colors.grey, fontSize: 16),
          
        ),
        SizedBox(height: 40,),
        VideoWidget(),
        Kheight,
        Row(
          mainAxisAlignment:MainAxisAlignment.end,
         
          children: [
        CustomAddButton(icon: Icons.ios_share, title:"Share"),KWidth,KWidth,
        CustomAddButton(icon: Icons.add, title: "My List"),KWidth,KWidth,
        CustomAddButton(icon: Icons.play_arrow, title: "Play"),KWidth,
        KWidth,
        ],)
      ],
    );
  }
}
