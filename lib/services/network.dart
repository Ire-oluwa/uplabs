import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uplabs/utilities/constants.dart';

class NewsData {
  Future getData() async {
    http.Response _response = await http.get(
      Uri.parse(newsUrl),
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
