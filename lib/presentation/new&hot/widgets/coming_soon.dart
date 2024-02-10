import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/core/colors/constants.dart';

class Comingsoon extends StatelessWidget {
  const Comingsoon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "FEB",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 60,
          height: 480,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
             children: [
              VideoWidget(),
              Kheight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kunfu Panda",
                    style: TextStyle(
                      fontSize: 33,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.notifications,
                            size: 18 ,
                            color: Kwhitecolor,
                          ),
                          Text(
                            "Remind me",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      KWidth,
                      KWidth,
                      Column(
                        children: [
                          Icon(
                            Icons.info,
                            color: Kwhitecolor,
                            size: 18,
                          ),
                          Text('info', style: TextStyle(fontSize: 10),)
                        ],
                      ),
                      KWidth,
                      KWidth,
                    ],
                  ),
                ],
              ),
              Kheight,
              Text("Coming On Friday"),
              Kheight, 
              Text('Kunfu Panda',style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700),),
                Text("Landing the lead in the school muscical is a\ndream come true for jodi until the presurre\nsends her confidence-and her relationship\nintoa tallpin.",style: TextStyle(color: Colors.grey),)
            ],
          ),
        ),
      ],
    );
  }
}

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/xMXK7OoT5GkaZrzQBque6nGwuL1.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 5,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 20,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_off,
                  size: 20,
                  color: Kwhitecolor,
                )),
          ),
        ),
      ],
    );
  }
}
