import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

final _widgetList= [
            const _smartdownloads(),
            Secssion2(),
            const Section3(),
          ];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarWidget(
              title: "Downloads",
            )),
        body:ListView.separated(
         padding:const EdgeInsets.all(10) ,
          // ignore: non_constant_identifier_names
          itemBuilder: (Ctx,index)=>_widgetList[index],
         // ignore: non_constant_identifier_names
         separatorBuilder: (Ctx,index)=>const SizedBox(height: 25,), 
         itemCount: _widgetList.length)
        );
  }
}

class Secssion2 extends StatelessWidget {
  Secssion2({super.key});
   final List imageList = [
    "https://media.themoviedb.org/t/p/w220_and_h330_face/qGz5rffXhegQH5PGUDiObqoOt06.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/kCGlIMHnOm8JPXq3rXM6c5wMxcT.jpg",
     "https://media.themoviedb.org/t/p/w220_and_h330_face/7Bd4EUOqQDKZXA6Od5gkfzRNb0.jpg",
  ];

  @override
  Widget build(BuildContext context) {
   
     final size = MediaQuery.of(context).size;
    return Column(children: [
       Kheight,
            const Text("Introducing Downloads for you",
            textAlign: TextAlign.center,
            style:TextStyle(color: Kwhitecolor,fontSize: 25,
            fontWeight: FontWeight.w400),
            ),
           Kheight,
            const Text(
                "We will download a personalised selection of\n movies for you,so there's\n something to watch on your\ndevice.",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,),

            SizedBox(
              width: size.width ,
              height: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: size.width * 0.4,
                      backgroundColor: const Color.fromARGB(255, 69, 68, 68),
                    ),
                  ),
                  DownloadsImageWidget(imageList:
                   imageList[2], 
                  margin: const EdgeInsets.only(left:180 ,bottom: 30),
                  angle: 20,
                  size: Size(size.width*0.4,size.width*0.58),
                  ),

                  DownloadsImageWidget(imageList:
                   imageList[1],
                   margin: const EdgeInsets.only(right:180 ,bottom: 30),
                   angle: -20,
                    size: Size(size.width*0.4,size.width*0.58),),

                  DownloadsImageWidget(imageList: 
                  imageList[0],
                    margin: const EdgeInsets.only(left: 0,top: 9),
                     size: Size(size.width*0.49,size.width*68),)  
                ],
              ),
            ),
    ],);
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
             SizedBox(
              width: double.infinity,
               child: ElevatedButton(
                style: const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.blue)),
                onPressed: () {},
                child: const Text(
                  "Set up",
                  style: TextStyle(color: Kwhitecolor, fontSize: 20),
                ),
                         ),
             ),
           Kheight,
           ElevatedButton(
              style: const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Kwhitecolor),
              ),
              onPressed: () {},
              child: const Text(
                "See what you can download",
                style: TextStyle(color: KBlackcolor, fontSize: 20),
              ),
            ),
    ],);
  }
}



// ignore: camel_case_types
class _smartdownloads extends StatelessWidget {
  const _smartdownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        KWidth,
        Icon(
          Icons.settings,
          color: Kwhitecolor,
        ),  KWidth,
        Text('smart  downloads'),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
     this.angle=0,
     required this.margin,
     required this.size,

  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle:angle*pi/180 ,   
      child: Container(
        margin: margin,
        width: size.width/1.2,
        height: size.width*1.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14 ),
            color: KBlackcolor,
            image: DecorationImage(
                image: NetworkImage(
                  imageList,
                ),
                fit: BoxFit.fill)),
      ),
    );
  }
}
