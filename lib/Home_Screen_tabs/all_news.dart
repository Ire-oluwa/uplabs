import 'package:flutter/material.dart';
import 'package:uplabs/pages/trending.dart';
import 'package:uplabs/utilities/constants.dart';
import 'package:uplabs/utilities/news_container.dart';
import 'package:uplabs/services/network.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
  void initState() {
    // TODO: implement initState
    print(imageU)
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: kTransparentColour,
        child: Column(
          children: <Widget>[
            const SizedBox(
              ///TODO: colour isn't necessary here.
              ///add a network image.
              height: 150.0,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                // child: Image.network(
                //   NewsData().getImageUrl(),
                //   fit: BoxFit.fill,
                // ),
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
