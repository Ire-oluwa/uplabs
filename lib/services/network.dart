import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uplabs/utilities/constants.dart';

class NewsApiService {
  static String _getCategoryUrl(String category, String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$apikey';
  }

  static Future fetchNews(String category, String country) async {
    http.Response _response = await http.get(
      Uri.parse(_getCategoryUrl(category, country)),
    );
    if (_response.statusCode == 200) {
      var _data = _response.body;
      var data = jsonDecode(_data);
      return data;
    } else {
      return _response.statusCode;
    }
  }
}
