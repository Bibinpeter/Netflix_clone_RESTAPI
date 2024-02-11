
import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/home/widget/custom_addbutton.dart';
import 'package:netflixapi/presentation/widgets/videowidget.dart';
import 'package:intl/intl.dart'; 

class ComingSoonInfoCard extends StatelessWidget {
  const ComingSoonInfoCard({
    super.key,
    required this.releaseDate,
    required this.originalTitle,
    required this.overview,
    required this.imageUrl,
  });

  final String releaseDate;
  final String originalTitle;
  final String overview;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  fetchDate(releaseDate),
                  style: const TextStyle(
                      fontSize: 18,
                      color: Kwhitecolor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(videoImage: imageUrl),
                Kheight,
                  Row(
          mainAxisAlignment:MainAxisAlignment.end,
          children: [
        CustomAddButton(icon: Icons.notifications,
         title:"Remind me",),KWidth,KWidth,
        CustomAddButton(icon: Icons.info, title: "Info"),KWidth,KWidth,
      
        ],
        ),
                Kheight,
                Text("Coming on ${fetchDay(releaseDate)}"),
                Kheight,
                Text(
                  originalTitle,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
          Kheight,
                Text(
                  overview,
                  style: const TextStyle(color: Colors.grey),
                ),
                Kheight,Kheight,
              ],
            ),
          ),
        ],
      ),
    );
  }

   String fetchDate(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final formatDate = (DateFormat.MMMMd().format(dateInFormat)).split(" ");
    return "${formatDate.first.substring(0, 3)} \n${formatDate.last} ";
  }

  String fetchDay(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final dayName = DateFormat('EEEE').format(dateInFormat);
    return dayName;
  }
}