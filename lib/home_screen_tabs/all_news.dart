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
  Future<String> getEntImageUrl() async {
    EntertainmentNewsData newsData = EntertainmentNewsData();
    var rawData = await newsData.getEntertainmentData();
    String imageUrl = rawData['articles'][0]['urlToImage'];
    return imageUrl;
  }

  Future<String> getEntFirstDescription() async {
    EntertainmentNewsData newsData = EntertainmentNewsData();
    var rawData = await newsData.getEntertainmentData();
    String firstNewsDescription = rawData['articles'][0]['description'];
    return firstNewsDescription;
  }

  Future<String> getEntFirstNews() async {
    EntertainmentNewsData newsData = EntertainmentNewsData();
    var rawData = await newsData.getEntertainmentData();
    String firstNewsContent = rawData['articles'][0]['url'];
    return firstNewsContent;
  }

  Future getTechNewsDescription() async {
    TechNews techNews = TechNews();
    var rawData = await techNews.getTechData();
    String techNewsDescription = rawData['articles'][0]['description'];
    return techNewsDescription;
  }

  @override
  void initState() {
    super.initState();
    getEntImageUrl();
    getEntFirstDescription();
    getEntFirstNews();
    getTechNewsDescription();
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
                  future: getEntImageUrl(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      final theImage = snapshot.data;
                      //TODO: make this swipe through images instead of one image.
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
                  //TODO: make the onTap/onSelection work, to display the news.
                  FutureBuilder(
                    future: getTechNewsDescription(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        final newsDescription = snapshot.data;
                        return NewsContainer(
                          newsDescription: newsDescription,
                          textButtonTitle: 'TECH',
                          backgroundColour: Colors.red,
                          onSelection: () {},
                        );
                      }
                      return NewsContainer(
                        newsDescription: '',
                        textButtonTitle: 'TECH',
                        backgroundColour: Colors.red,
                        onSelection: () {},
                      );
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
                  FutureBuilder(
                    future: getEntFirstDescription(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        final newsDesc = snapshot.data;
                        return NewsContainer(
                          newsDescription: newsDesc,
                          textButtonTitle: 'ENTERTAINMENT',
                          backgroundColour: Colors.yellow,
                          onSelection: () {},
                        );
                      }
                      return NewsContainer(
                        newsDescription: 'failed to load news content',
                        onSelection: () {},
                        backgroundColour: Colors.yellow,
                        textButtonTitle: 'ENTERTAINMENT',
                      );
                    },
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
