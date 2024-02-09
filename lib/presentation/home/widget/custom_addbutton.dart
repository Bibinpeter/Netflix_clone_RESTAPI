import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({
    super.key,required this.icon,required this.title
  });
 final IconData icon;
 final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Kwhitecolor,
          size: 30,
        ),
        Text(title),
      ],
    );
  }
}