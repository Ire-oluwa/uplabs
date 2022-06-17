import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uplabs/services/date.dart';

Date date = Date();
String currentDate = date.printDate();

class News {
  Future getData() async {
    http.Response _response = await http.get(Uri.parse(''));
    if (_response.statusCode == 200) {
      var _data = _response.body;
      var data = jsonDecode(_data);
      return data;
    } else {
      return _response.statusCode;
    }
  }

  Future<String> socialNews() async {
    News news = News();
    var rawData = await news.getData();
    String socialNewsContent = rawData['articles'][0]['content'];
    print(socialNewsContent);
    return socialNewsContent;
  }
}

void main() async {
  News news = News();
  await news.socialNews();
}
