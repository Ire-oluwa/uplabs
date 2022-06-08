import 'package:flutter/material.dart';
import 'package:uplabs/pages/trending.dart';
import 'package:uplabs/services/network.dart';
import 'package:uplabs/utilities/constants.dart';
import 'package:uplabs/utilities/news_container.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  Future<String> getImageUrl() async {
    NewsData newsData = NewsData();
    var rawData = await newsData.getData();
    String imageUrl = rawData['articles'][0]['urlToImage'];
    return imageUrl;
  }

  Future<String> getFirstDescription() async {
    NewsData newsData = NewsData();
    var rawData = await newsData.getData();
    String firstNewsDescription = rawData['articles'][0]['description'];
    return firstNewsDescription;
  }

  Future<String> getFirstNews() async {
    NewsData newsData = NewsData();
    var rawData = await newsData.getData();
    String firstNewsContent = rawData['articles'][0]['url'];
    return firstNewsContent;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageUrl();
    getFirstDescription();
    getFirstNews();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: kTransparentColour,
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FutureBuilder(
                  future: getImageUrl(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      final theImage = snapshot.data;
                      return Image.network(
                        theImage,
                        fit: BoxFit.fill,
                      );
                    }
                    return const Center(
                      child: Text('Error loading this image'),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Trending',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20.0,
                          color: kThemeColour,
                        ),
                      ),
                      //TODO: make this icon navigate to a page.
                      RawMaterialButton(
                        fillColor: kThemeColour,
                        shape: const CircleBorder(),
                        onPressed: () {
                          Navigator.pushNamed(context, TrendingNews.id);
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder(
                    future: getFirstDescription(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        final newsDesc = snapshot.data;
                        return NewsContainer(
                          newsDescription: newsDesc,
                          textButtonTitle: 'TECH',
                          backgroundColour: Colors.red,
                          onSelection: () {},
                        );
                      }
                      return const Text('failed to load news content');
                    },
                  ),
                  NewsContainer(
                    newsDescription: '',
                    textButtonTitle: 'SOCIAL',
                    backgroundColour: Colors.purple,
                    onSelection: () {},
                  ),
                  NewsContainer(
                    newsDescription: '',
                    textButtonTitle: 'CULTURE',
                    backgroundColour: Colors.green,
                    onSelection: () {},
                  ),
                  NewsContainer(
                    newsDescription: '',
                    textButtonTitle: 'ENTERTAINMENT',
                    backgroundColour: Colors.yellow,
                    onSelection: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
