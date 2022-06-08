import 'package:flutter/material.dart';
import 'package:uplabs/services/date.dart';

Date date = Date();
final String currentDate = date.printDate();

const Color kThemeColour = Color(0xFF000050);
const Color kTransparentColour = Color(0x32AEB0B2);
const TextStyle kNewsContainerTextStyle = TextStyle(
  color: kThemeColour,
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);

String hostFileName = 'https://newsapi.org/v2/everything?q=apple&from=';
String endPoint = 'sortBy=popularity&apiKey';
String apikey = '4080a7bbbacd4834bcfb66072c795145';
String newsUrl = '$hostFileName$currentDate&to=$currentDate&$endPoint=$apikey';
