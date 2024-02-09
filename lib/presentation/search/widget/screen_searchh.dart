import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/core/colors/constants.dart';
 
import 'package:netflixapi/presentation/search/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.shade900,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(Icons.cancel,color:Colors.grey,),
              style: const TextStyle(color:Kwhitecolor),
            ),
            Kheight,
           // Expanded(child: SearchIdle())
           Expanded(child: SearchResultWidget())
                  ],
                ),
          )),
    );
  }
}
