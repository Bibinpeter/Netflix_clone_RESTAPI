import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/search/title.dart';

// ignore: constant_identifier_names
const ImageUrl =
    "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/mpIpHN7DJprENGiSvxOaG5mLzht.jpg";

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTile(title: 'Top searches',),
        Kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => Kheight,
              itemCount: 10),
        )
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.4,
          height: 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(ImageUrl), fit: BoxFit.cover),
          ),
        ),
        KWidth,
         const Expanded(
            child: Text(
          "Movie Name",
          style: TextStyle(
            color: Kwhitecolor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        )),
        const CircleAvatar(radius:23,
        child: CircleAvatar(radius: 22,
        backgroundColor: Colors.black,
        child: Icon(CupertinoIcons.play_fill,color: Kwhitecolor,),
        ),)
      ],
    );
  }
}
