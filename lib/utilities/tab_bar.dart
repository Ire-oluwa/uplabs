import 'package:flutter/material.dart';
import 'package:uplabs/models/category.dart';

class NewsTabs extends StatelessWidget {
  const NewsTabs({Key? key, required this.newsTitle}) : super(key: key);
  final String newsTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            newsTitle,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}

List<NewsTabs> newsTabs() {
  return getAllCategories()
      .map((e) => NewsTabs(
            newsTitle: e.title,
          ))
      .toList();
}
