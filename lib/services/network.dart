import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uplabs/utilities/constants.dart';

class EntertainmentNewsData {
  Future getEntertainmentData() async {
    http.Response _response = await http.get(
      Uri.parse(entertainmentNewsUrl),
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

class TechNews {
  Future getTechData() async {
    http.Response _response = await http.get(Uri.parse(techNewsUrl));
    if (_response.statusCode == 200) {
      var _data = _response.body;
      var data = jsonDecode(_data);
      return data;
    } else {
      return _response.statusCode;
    }
  }

  Future<String> getEntImageUrl() async {
    EntertainmentNewsData newsData = EntertainmentNewsData();
    var rawData = await newsData.getEntertainmentData();
    String imageUrl = rawData['articles'][0]['urlToImage'];
    return imageUrl;
  }
}
