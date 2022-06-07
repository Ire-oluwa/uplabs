import 'package:flutter/material.dart';
import 'package:uplabs/services/network.dart';

NewsData newsData = NewsData();

class TrendingNews extends StatelessWidget {
  static const String id = 'TrendingNews';

  const TrendingNews({Key? key}) : super(key: key);

  Future<String> getNewsDescription() async {
    var x = await newsData.getData();
    String newsDescription = x['articles'][0]['description'];
    return newsDescription;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
                const Center(
                  child: Text('Twitter Trends 🤪'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
