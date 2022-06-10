import 'package:flutter/material.dart';
import 'package:uplabs/home_screen_tabs/all_news.dart';
import 'package:uplabs/services/network.dart';
import 'package:uplabs/utilities/constants.dart';

EntertainmentNewsData newsData = EntertainmentNewsData();
const AllNews _allNews = AllNews();
TechNews techNews = TechNews();
const String newsDesc = '';


class TrendingNews extends StatelessWidget {
  static const String id = 'TrendingNews';

  const TrendingNews({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kTransparentColour,
        child: const Center(
          child: Text(
            'Trending',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

Widget condition() {
  Widget widget;
  switch(newsDesc){
    case newsDesc == techNews.
  }
}
