import 'package:flutter/material.dart';
import 'package:uplabs/models/category.dart';
import 'package:uplabs/services/network.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.category}) : super(key: key);
  final Category category;

  Future<String> fetchNews(String category, String country) async {
    var rawData = await NewsApiService.fetchNews(category, country);
    return rawData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(decoration: const BoxDecoration(color: Colors.white));
  }
}
