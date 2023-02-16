import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uplabs/database/favourite_database.dart';
import 'package:uplabs/models/favourite.dart';
import 'package:uplabs/models/favourite_list.dart';
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
  late bool isClicked = false;

  Future<NewsResponse> fetchNews(String category, String country) async {
    var rawData = await NewsApiService.fetchNews(category, country);
    return rawData;
  }

  @override
  void initState() {
    _newsResponse = fetchNews(widget.categoryTitle, 'ng');
    super.initState();
  }

  void toggleFavourite() {
    setState(() {
      if (isClicked) {
        isClicked = false;
      } else {
        isClicked = true;
      }
    });
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
            var article = snapshot.data?.articles?[index];
            postUrl = article?.url ?? 'http://google.com';
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
              leading: Image.network(
                article?.urlToImage ?? defaultNetworkImage,
                height: 100.0,
                width: 130.0,
              ),
              title: Text(
                article?.title ?? '',
                maxLines: 2,
              ),
              subtitle: Text(
                article?.description ?? '',
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () async {
                  // ignore: todo
                  //TODO: not sure if this will work too.
                  toggleFavourite();
                  Provider.of<FavouriteList>(context, listen: false)
                      .favourites
                      .add(
                        Favourite(
                          imageUrl: article?.urlToImage ?? defaultNetworkImage,
                          title: article?.title ?? '',
                          description: article?.description ?? '',
                        ),
                      );
                  await FavouriteDatabase.instance
                      .update(Provider.of<FavouriteList>(context).favourite);
                },
                icon: isClicked
                    ? const Icon(
                        Icons.bookmark,
                        color: kThemeColour,
                      )
                    : const Icon(Icons.bookmark_border),
              ),
            );
          },
        );
      },
    );
  }
}
