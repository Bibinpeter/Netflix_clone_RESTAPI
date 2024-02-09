 import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/widgets/main_homecard.dart';
import 'package:netflixapi/presentation/widgets/main_title.dart';

class MainTittleCard extends StatelessWidget {
  const MainTittleCard({
    super.key,required this.title
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         MainTitle(
          title:title,
        ),
        LimitedBox(
          maxHeight: 250,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(5),
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => const Padding(
                padding: EdgeInsets.only(right: 12.0), // Adjust the right spacing as needed
                child: MainCardHome(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


 