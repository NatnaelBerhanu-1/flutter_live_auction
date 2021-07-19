import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_auction/constants.dart';

class AuctionDetailPage extends StatefulWidget {
  static final String pageName = "auctionDetail";
  @override
  State<AuctionDetailPage> createState() {
    return _AuctionDetailPage();
  }
}

class _AuctionDetailPage extends State<AuctionDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColorLight,
      body: Center(
        child: Text("AuctionDetailPage"),
      ),
    );
  }
}