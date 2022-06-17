import 'package:flutter/material.dart';
import 'package:uplabs/models/category.dart';
import 'package:uplabs/pages/newslist.dart';

//tech, social, culture, entertainment.
class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  final categories = getAllCategories();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              child: ListTile(
                title: Text(categories[index].title),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsList(category: categories[index]),
                  ),
                );
              },
            ),
          );
        });
  }
}
