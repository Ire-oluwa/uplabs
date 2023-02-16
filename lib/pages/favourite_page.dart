import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:uplabs/database/favourite_database.dart';
import 'package:uplabs/models/favourite.dart';
import 'package:uplabs/models/favourite_list.dart';
import 'package:uplabs/models/news_response.dart';
// import 'package:uplabs/pages/favourite.detail_page.dart';
import 'package:uplabs/services/network.dart';
// import 'package:uplabs/utilities/constants.dart';

class FavouritePage extends StatefulWidget {
  static const String id = 'FavouritePage';

  const FavouritePage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late final Favourite favourite;
  late final String postUrl;
  bool isLoading = false;
  late List<Favourite> favouriteList =
      Provider.of<FavouriteList>(context).favourites;

  Future<NewsResponse> fetchNews(String category, String country) async {
    var rawData = await NewsApiService.fetchNews(category, country);
    return rawData;
  }

  @override
  void initState() {
    refreshFavourite();
    super.initState();
  }

  @override
  void dispose() {
    FavouriteDatabase.instance.close();
    super.dispose();
  }

  Future refreshFavourite() async {
    setState(() {
      isLoading = true;
    });
    favouriteList = await FavouriteDatabase.instance.readAllFavourite();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Center(
            child: Text("Favourites"),
          ),
        ),
      ),
    );
  }
}

// Widget buildFavourites(BuildContext context, String postUrl,
//         Future Function() refreshFavourites) =>
//     StaggeredGridView.countBuilder(
//       shrinkWrap: true,
//       staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
//       padding: const EdgeInsets.all(8),
//       itemCount: Provider.of<FavouriteList>(context).favourites.length,
//       crossAxisCount: 4,
//       mainAxisSpacing: 4,
//       crossAxisSpacing: 4,
//       itemBuilder: (context, index) {
//         final favourite = Provider.of<FavouriteList>(context).favourites[index];
//         return GestureDetector(
//           onTap: () async {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => FavouriteDetailPage(
//                   favouriteID: favourite.id!,
//                   postUrl: postUrl,
//                 ),
//               ),
//             );
//             refreshFavourites;
//           },
//           child: Column(
//             children: Provider.of<FavouriteList>(context)
//                 .favourites
//                 .map(
//                   (e) => ListTile(
//                     leading: SizedBox(
//                       width: 130.0,
//                       child: Image.asset(
//                         e.imageUrl,
//                         height: 100.0,
//                       ),
//                     ),
//                     title: Text(
//                       e.title,
//                       maxLines: 2,
//                     ),
//                     subtitle: Text(
//                       e.description,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//           onLongPress: () async {
//             await FavouriteDatabase.instance.delete(favourite.id!);
//           },
//         );
//       },
//     );
