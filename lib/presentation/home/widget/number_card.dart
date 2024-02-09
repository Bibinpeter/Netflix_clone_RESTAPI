import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key,required this.index});
final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(height:150,width:70,),
            Container( 
              width: 140, 
              height: 260, 
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage("https://media.themoviedb.org/t/p/w220_and_h330_face/ofTnrgEwtPILNfjwk0FAx3bfwZ6.jpg"),
                 fit: BoxFit.cover
                ),
              ),
            ),
          ],
        ),
      Positioned(
  left: 10,
  top: 80,
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