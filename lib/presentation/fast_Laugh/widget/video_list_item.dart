import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //leftside
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 25,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_off,
                        size: 25,
                        color: Kwhitecolor,
                      )),
                ),

                //right side
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 28 ,
                      backgroundImage: NetworkImage(
                          "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/mpIpHN7DJprENGiSvxOaG5mLzht.jpg"),
                    ),
                    VideoActionsWidget(
                        icon: Icons.emoji_emotions, title: "LOL"),
                    VideoActionsWidget(icon: Icons.add, title: "My List"),
                    VideoActionsWidget(icon: Icons.share, title: "Share"),
                    VideoActionsWidget(icon: Icons.play_arrow, title: "Play")
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Kwhitecolor,
          ),
          Text(title),
        ],
      ),
    );
  }
}
