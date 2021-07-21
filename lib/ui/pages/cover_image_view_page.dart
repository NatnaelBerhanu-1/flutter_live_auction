import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_auction/constants.dart';

class CoverImageViewPage extends StatelessWidget {
  static final pageName = "coverImageViewPage";
  final imageUrl;
  CoverImageViewPage({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.65),
      body: GestureDetector(
        onVerticalDragDown: (DragDownDetails details){
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.network(
              imageUrl,
              width: kScreenWidth(context),
              height: kScreenHeight(context) * 0.8,
              fit: BoxFit.fitWidth,
              errorBuilder: (context, error, stackTrace) => Center(child:Text("Couldn't load image.")),
            ),
          ),
        ),
      ),
    );
  }
}
