import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:live_auction/core/viewModels/auction_viewmodel.dart';
import 'package:live_auction/locator.dart';
import 'package:live_auction/ui/pages/auction_detail_page.dart';
import 'package:live_auction/ui/pages/cover_image_view_page.dart';
import 'package:live_auction/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  /// Initialize firebase
  await Firebase.initializeApp();

  /// Setup dependencies using getit
  setupLocator();

  /// Initialize provider
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
        }else if(settings.name == CoverImageViewPage.pageName){
          return PageRouteBuilder(pageBuilder: (context, _, __) => CoverImageViewPage(imageUrl:settings.arguments),opaque: false);
        }
      },
      home: HomePage(),
      builder: EasyLoading.init(),
    );
  }
}