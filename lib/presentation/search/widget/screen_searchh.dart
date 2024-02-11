import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapi/api/api.dart';
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/models/movie.dart';
import 'package:netflixapi/presentation/search/search_idle.dart.dart';
import 'package:netflixapi/presentation/search/search_result.dart';

ValueNotifier<List<Movie>> searchNotifier = ValueNotifier([]);

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final searchController = TextEditingController();
  late Future<List<Movie>> wholeMovies;
  bool _isSearch = false;

  @override
  void initState() {
    wholeMovies = Api().everyonesWatchingMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CupertinoTextField(
              controller: searchController,
              onChanged: (value) async {
                searchNotifier.value = await Api().getSearchedMovies(searchController.text);
              },
              onTap: () {
                setState(() {
                  _isSearch = true;
                });
              },
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.withOpacity(0.4),
              ),
              prefix: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffix: const Icon(CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey),
              style: const TextStyle(color: Colors.white),
            ),
            Kheight,
            _isSearch == false
                ? Expanded(
                    child: SearchIdleWidget(
                      movie:wholeMovies,
                  ))
                : const Expanded(child: SearchResultWidget())
          ],
        ),
      )),
    );
  }
}