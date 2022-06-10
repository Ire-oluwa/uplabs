import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uplabs/services/date.dart';
import 'package:uplabs/utilities/constants.dart';

Date date = Date();
String currentDate = date.printDate();

class TechNews {
  Future getData() async {
    http.Response _response = await http.get(Uri.parse(techNewsUrl));
    if (_response.statusCode == 200) {
      var _data = _response.body;
      var data = jsonDecode(_data);
      return data;
    } else {
      return _response.statusCode;
    }
  }
}

void main() async {}