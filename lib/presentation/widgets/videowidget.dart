import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/xMXK7OoT5GkaZrzQBque6nGwuL1.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 5,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 20,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_off,
                  size: 20,
                  color: Kwhitecolor,
                )),
          ),
        ),
      ],
    );
  }
}