import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uplabs/models/news_response.dart';
import 'package:uplabs/utilities/constants.dart';

class NewsApiService {
  static String _getCategoryUrl(String category, String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$apikey';
  }

  static Future<NewsResponse> fetchNews(String category, String country) async {
    http.Response _response = await http.get(
      Uri.parse(_getCategoryUrl(category, country)),
    );
    // ignore: prefer_typing_uninitialized_variables
    var newsResponse;

    if (_response.statusCode == 200) {
      var _data = _response.body;
      var data = jsonDecode(_data);
      var newsResponse = NewsResponse.fromJson(data);
      return newsResponse;
    } else {
      return newsResponse;
    }
  }
}
