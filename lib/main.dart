import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:live_auction/core/viewModels/auction_viewmodel.dart';
import 'package:live_auction/locator.dart';
import 'package:live_auction/ui/pages/auction_detail_page.dart';
import 'package:live_auction/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<AuctionViewModel>()),
      ],
      child: MyApp()));
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
        }else if(settings.name == HomePage.pageName){
          return MaterialPageRoute(builder: (context) => HomePage());
        }
      },
      home: HomePage(),
    );
  }
}