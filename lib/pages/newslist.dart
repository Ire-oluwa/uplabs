import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uplabs/models/category.dart';
import 'package:uplabs/models/news_response.dart';
import 'package:uplabs/services/network.dart';
import 'package:uplabs/utilities/constants.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  Future<NewsResponse> fetchNews(String category, String country) async {
    var rawData = await NewsApiService.fetchNews(category, country);
    return rawData;
  }

  late Future<NewsResponse> _newsResponse;

  @override
  void initState() {
    // TODO: implement initState
    _newsResponse = fetchNews(widget.category.title, 'ng');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kThemeColour,
      ),
      body: SafeArea(
        child: FutureBuilder<NewsResponse>(
          future: _newsResponse,
          builder:
              (BuildContext context, AsyncSnapshot<NewsResponse> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kThemeColour,
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.articles?.length,
              itemBuilder: (context, index) {
                var article = snapshot.data?.articles?[index];
                return Container(
                  height: 100,
                  decoration: const BoxDecoration(color: kTransparentColour),
                  child: Row(
                    children: <Widget>[
                      Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            article?.urlToImage ?? 'https://picsum.photos/200',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article?.title ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                article?.description ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
