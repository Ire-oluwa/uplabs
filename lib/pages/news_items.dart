import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uplabs/models/category.dart';
import 'package:uplabs/utilities/constants.dart';
import 'package:uplabs/utilities/news_screen.dart';
import 'package:uplabs/utilities/tab_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsItems extends StatefulWidget {
  const NewsItems({Key? key}) : super(key: key);
  static const String id = 'NewsItems';

  @override
  State<NewsItems> createState() => _NewsItemsState();
}

class _NewsItemsState extends State<NewsItems> {
  final _tabs = newsTabs();
  final categories = getAllCategories();
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('UpLabs'),
          centerTitle: true,
          backgroundColor: kThemeColour,
          bottom: TabBar(
            isScrollable: true,
            onTap: (index) {},
            indicatorColor: kTransparentColour,
            tabs: _tabs,
          ),
        ),
        body: TabBarView(children: newsScreen()),
      ),
    );
  }
}

List<NewsScreen> newsScreen() {
  return getAllCategories()
      .map((e) => NewsScreen(
            categoryTitle: e.title,
          ))
      .toList();
}
