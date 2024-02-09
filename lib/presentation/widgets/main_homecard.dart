import 'package:flutter/material.dart';
 

class MainCardHome extends StatelessWidget {
  const MainCardHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container( 
      width: 140, 
      height: 260, 
      decoration: BoxDecoration( 
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage("https://media.themoviedb.org/t/p/w220_and_h330_face/5InVYa7CcbGioPvQ6ig4Lz4iLlR.jpg"),
         fit: BoxFit.cover
        ),
      ),
    );
  }
}
