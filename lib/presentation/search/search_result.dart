import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/search/title.dart';
 
 const imageUrl="https://media.themoviedb.org/t/p/w220_and_h330_face/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg";
class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTile(title: "Movies & TV"),
        Kheight,
        Expanded(
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio:1/1.4 ,
                children: List.generate(20, (index) {
                  return MainCardd();
                })
                )
                )
      ],
    );
  }
}

class MainCardd extends StatelessWidget {
  const MainCardd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       image: const DecorationImage(image: 
       NetworkImage(imageUrl),
       fit: BoxFit.cover) ,
       borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
