import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uplabs/services/date.dart';

Date date = Date();
String currentDate = date.printDate();

class Network {
  String api =
      'https://newsapi.org/v2/everything?q=tesla&from=$currentDate&sortBy=publishedAt&apiKey=4080a7bbbacd4834bcfb66072c795145';

  Future getData() async {
    http.Response response = await http.get(Uri.parse(api));
    final data = response.body;
    final decodedData = jsonDecode(data);
    //print(decodedData);
    return decodedData;
  }

  Future<String> getFirstTitle() async {
    Network network = Network();
    var rawData = await network.getData();
    String firstNewsTitle = rawData['articles'][0]['title'];
    print(firstNewsTitle);
    return firstNewsTitle;
  }
}

void main() async {
  Network network = Network();
  var result = await network.getData();
  var x = await network.getFirstTitle();
  var imageUrl = result['articles'][0]['urlToImage'];
}
