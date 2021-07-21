import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live_auction/core/api/api.dart';
import 'package:live_auction/locator.dart';

class AuctionViewModel extends ChangeNotifier {
  Api _api = locator<Api>();

  Stream<DocumentSnapshot> getAuctionAsStream(String id){
    return _api.streamDocument(id);
  }
}