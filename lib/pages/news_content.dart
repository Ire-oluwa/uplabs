import 'package:flutter/material.dart';
import 'package:uplabs/models/category.dart';
import 'package:uplabs/models/news_response.dart';
import 'package:uplabs/services/network.dart';
import 'package:uplabs/utilities/constants.dart';

class NewsContent extends StatefulWidget {
  const NewsContent({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  State<NewsContent> createState() => _NewsContentState();
}

class _NewsContentState extends State<NewsContent> {
  Future<NewsResponse> fetchNews(String category) async {
    var rawContent = await NewsApiService.fetchNews(category, 'ng');
    return rawContent;
  }

  late Future<NewsResponse> _newsContent;

  @override
  void initState() {
    _newsContent = fetchNews(widget.category.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kThemeColour,
      ),
      body: FutureBuilder<NewsResponse>(
          future: _newsContent,
          builder: (context, AsyncSnapshot<NewsResponse> snapshot) {
            var newsContent = snapshot.data?.articles;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Error');
            }
            return ListView.builder(itemBuilder: (context, index) {
              return Text(newsContent![index].content ?? '');
            });
          }),
    );
  }
}
