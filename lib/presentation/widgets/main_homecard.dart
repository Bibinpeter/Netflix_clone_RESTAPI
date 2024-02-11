import 'package:flutter/material.dart';
 

class MainCardHome extends StatelessWidget {
   const MainCardHome({
    super.key,
    required this.image,
  });
final String image;
  @override
  Widget build(BuildContext context) {
    return Container( 
      width: 140, 
      height: 260, 
       decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(10),
            image:
                DecorationImage(fit: BoxFit.cover,
                 image: NetworkImage(image))),
      );
    
  }
}