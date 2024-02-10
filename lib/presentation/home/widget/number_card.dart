import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';

class NumberCard extends StatelessWidget {
   NumberCard({super.key,required this.index,
   required this.image});
final int index;
final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image))),
            ),
          ],
        ),
      Positioned(
  left: 10,
  top: 38,
  child: ShaderMask(
    shaderCallback: (Rect bounds) {
      return const LinearGradient(
        colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 0, 0, 0)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(bounds);
    },
    child: BorderedText(
      strokeColor:Kwhitecolor,
      child: Text(
        "${index+1}",
        style: const TextStyle(
          fontSize: 150,
          fontWeight: FontWeight.w800,
          color: Color.fromARGB(255, 192, 191, 194), // Set your desired text color here
        ),
      ),
    ),
  ),
)

   
      ],
    );
  }
}