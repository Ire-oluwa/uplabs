import 'package:flutter/material.dart';

const Color kThemeColour = Color(0xFF000050);
const Color kTransparentColour = Color(0x32AEB0B2);
const TextStyle kNewsContainerTextStyle = TextStyle(
  color: kThemeColour,
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);

// const String apiKey = '4080a7bbbacd4834bcfb66072c795145';
// const String urlPath =
//     'https://newsapi.org/v2/everything?q=apple&from=2022-05-31&to=2022-05-31&sortBy=popularity';
const String newsUrl =
    'https://newsapi.org/v2/everything?q=apple&from=2022-06-01&to=2022-06-01&sortBy=popularity&apiKey=4080a7bbbacd4834bcfb66072c795145';
