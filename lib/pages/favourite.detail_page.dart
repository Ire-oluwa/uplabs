import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uplabs/database/favourite_database.dart';
import 'package:uplabs/models/favourite.dart';
import 'package:uplabs/models/favourite_list.dart';
import 'package:uplabs/utilities/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FavouriteDetailPage extends StatefulWidget {
  const FavouriteDetailPage({
    Key? key,
    required this.favouriteID,
    required this.postUrl,
  }) : super(key: key);
  final int favouriteID;
  final String postUrl;

  @override
  State<FavouriteDetailPage> createState() => _FavouriteDetailPageState();
}

class _FavouriteDetailPageState extends State<FavouriteDetailPage> {
  late List<Favourite> favouritesList =
      Provider.of<FavouriteList>(context).favourites;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  late Favourite favourite;
  bool isLoading = false;

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    refreshFavourite();
    super.initState();
  }

  Future refreshFavourite() async {
    setState(() {
      isLoading = true;
    });
    favouritesList = await FavouriteDatabase.instance.readAllFavourite();
    setState(() {
      isLoading = false;
    });
  }

  // ignore: todo
  //TODO: navigate from FavouritePage to here.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const SizedBox(
              height: 40.0,
              child: CircularProgressIndicator(
                color: kThemeColour,
              ),
            )
          : SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: WebView(
                  initialUrl: widget.postUrl,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                ),
              ),
            ),
    );
  }
}
