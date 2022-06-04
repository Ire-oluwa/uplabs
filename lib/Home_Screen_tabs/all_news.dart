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
  NewsData newsData = NewsData();

  late Future<String> _imageLink;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageLink = newsData.getImageUrl();
    print(_imageLink);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: kTransparentColour,
        child: Column(
          children: <Widget>[
            SizedBox(
              ///TODO: colour isn't necessary here.
              ///fix the future builder
              ///add a network image.
              height: 150.0,
              child: SizedBox(
                child: FutureBuilder<dynamic>(
                  initialData:
                      'https://cdn.vox-cdn.com/thumbor/aPtSiY3IyT29LdMsLwOmVBQmIks=/0x59:2126x1172/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/23599259/dell_webcam_monitor.png',
                  future: _imageLink,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      final imageUrl = snapshot.data;
                      Image.network(imageUrl);
                    }
                    return const Center(
                      child: Text(
                        'Error fetching this image',
                      ),
                    );
                  },
                ),
              ),
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
                  //TODO: Extract this widget.
                  const NewsContainer(
                    newsText: '',
                    textButtonTitle: 'TECH',
                    backgroundColour: Colors.red,
                  ),
                  const NewsContainer(
                    newsText: '',
                    textButtonTitle: 'SOCIAL',
                    backgroundColour: Colors.purple,
                  ),
                  const NewsContainer(
                    newsText: '',
                    textButtonTitle: 'CULTURE',
                    backgroundColour: Colors.green,
                  ),
                  const NewsContainer(
                    newsText: '',
                    textButtonTitle: 'ENTERTAINMENT',
                    backgroundColour: Colors.yellow,
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
