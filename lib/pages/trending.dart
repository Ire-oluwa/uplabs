import 'package:flutter/material.dart';

class TrendingNews extends StatelessWidget {
  static const String id = 'TrendingNews';

  const TrendingNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
