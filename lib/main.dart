import 'package:flutter/material.dart';
import 'package:live_auction/pages/auction_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Live auction',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: (settings) {
        if(settings.name == AuctionDetailPage.pageName){
          return MaterialPageRoute(builder: (context) => AuctionDetailPage());
        }
      },
      home: AuctionDetailPage(),
    );
  }
}