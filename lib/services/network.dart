import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uplabs/utilities/constants.dart';

class NewsData {
  Future getImageUrl() async {
    http.Response _response = await http.get(
      Uri.parse(newsUrl),
    );
    if (_response.statusCode == 200) {
      var _data = _response.body;
      var newsData = jsonDecode(_data);
      var imageUrl = newsData['article'][0].urlToImage;
      return imageUrl;
    } else {
      return _response.statusCode;
    }
  }
}
