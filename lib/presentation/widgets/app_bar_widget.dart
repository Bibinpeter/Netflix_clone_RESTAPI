import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixapi/core/colors/constants.dart';

class AppBarWidget extends StatelessWidget {
   AppBarWidget({super.key,required this.title});
 final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          KWidth,
          Text(title,style:GoogleFonts.montserrat(
            fontSize: 30 ,fontWeight: FontWeight.w600),),
          const Spacer(),
          const Icon(Icons.cast,color: Colors.white,),
         KWidth,
          Container(
            color: Colors.blue,
            width: 28,
            height: 28, 
          ),
          KWidth,
        ],
      ),
    );
  }
}