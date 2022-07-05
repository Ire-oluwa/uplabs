import 'package:flutter/material.dart';
import 'package:uplabs/models/news_response.dart';
import 'package:uplabs/pages/display_full_news.dart';
import 'package:uplabs/services/network.dart';
import 'package:uplabs/utilities/constants.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key, required this.categoryTitle}) : super(key: key);
  final String categoryTitle;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<NewsResponse> _newsResponse;
  late String postUrl;

  Future<NewsResponse> fetchNews(String category, String country) async {
    var rawData = await NewsApiService.fetchNews(category, country);
    return rawData;
  }

  @override
  void initState() {
    _newsResponse = fetchNews(widget.categoryTitle, 'ng');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: _newsResponse,
      builder: (BuildContext context, AsyncSnapshot<NewsResponse> snapshot) {
        if (snapshot.hasError ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: kThemeColour,
            ),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data?.articles?.length,
          itemBuilder: (BuildContext context, int index) {
            var articles = snapshot.data?.articles?[index];
            postUrl = articles?.url ?? 'http://google.com';
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsView(
                      postUrl: postUrl,
                    ),
                  ),
                );
              },
              leading: SizedBox(
                width: 130.0,
                child: Image.network(
                  articles?.urlToImage ?? defaultNetworkImage,
                  height: 100.0,
                ),
              ),
              title: Text(
                articles?.title ?? '',
                maxLines: 2,
              ),
              subtitle: Text(
                articles?.description ?? '',
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {
                  //TODO:add the clicked news tile to the list of favourites.
                  const Icon(
                    Icons.bookmark_added,
                    color: kThemeColour,
                  );
                },
                icon: const Icon(
                  Icons.bookmark_border,
                  color: Colors.grey,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
