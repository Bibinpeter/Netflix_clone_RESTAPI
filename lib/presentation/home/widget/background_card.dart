import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/presentation/home/widget/custom_addbutton.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return   Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 600,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://media.themoviedb.org/t/p/w220_and_h330_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomAddButton(icon: 
                       Icons.add,title: "My List"),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: _playbutton(),
                          ),
                          CustomAddButton(icon: Icons.info,
                           title: "Info")
                        ],
                      ),
                    ),
                  )
                ],
              );
  }
}

class _playbutton extends StatelessWidget {
  const _playbutton();

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Kwhitecolor)),
        icon: const Icon(
          Icons.play_arrow,
          color: KBlackcolor,
        ),
        label: const Text(
          "Play",
          style: TextStyle(color: KBlackcolor),
        ));
  }
}