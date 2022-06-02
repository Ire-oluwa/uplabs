import 'package:flutter/material.dart';
import 'package:uplabs/Home_Screen_tabs//all_news.dart';
import 'package:uplabs/Home_Screen_tabs//entertainment.dart';
import 'package:uplabs/Home_Screen_tabs//sports.dart';
import 'package:uplabs/utilities/constants.dart';
import 'package:uplabs/utilities/tab_bar.dart';

class HomePage extends StatelessWidget {
  static const String id = 'HomePage';

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kThemeColour,
          leading: const Icon(
            Icons.short_text,
            size: 30.0,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(
                right: 10.0,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
              ),
            )
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: TabBars(),
          ),
        ),
        body: const TabBarView(
          children: [
            AllNews(),
            Sports(),
            Entertainment(),
          ],
        ),
      ),
    );
  }
}
