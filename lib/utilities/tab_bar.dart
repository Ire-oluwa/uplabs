import 'package:flutter/material.dart';

class TabBars extends StatelessWidget {
  const TabBars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorColor: Colors.transparent,
      //isScrollable: true,
      tabs: [
        Tab(
          text: 'All News',
        ),
        Tab(
          text: 'Sports',
        ),
        Tab(
          text: 'Entertainment',
        ),
      ],
    );
  }
}
