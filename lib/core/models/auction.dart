import 'package:cloud_firestore/cloud_firestore.dart';

class Auction {
  late String auctionPicUrl;
  late String category;
  late double currentBid;
  late Timestamp deadline;
  late String description;
  late String ownerName;
  late String ownerProfilePicUrl;
  late String title;
  late int totalBids;

  Auction(
      {required this.auctionPicUrl,
      required this.category,
      required this.currentBid,
      required this.deadline,
      required this.description,
      required this.ownerName,
      required this.ownerProfilePicUrl,
      required this.title,
      required this.totalBids});

  factory Auction.fromJson(Map<String, dynamic> json) {
    return Auction(
        auctionPicUrl: json['auction_pic_url'],
        category: json['category'],
        currentBid: json['current_bid'],
        deadline: json['deadline'],
        description: json['description'],
        ownerName: json['owner_name'],
        ownerProfilePicUrl: json['owner_profile_pic_url'],
        title: json['title'],
        totalBids: json['total_bids']);
  }

  Map<String, dynamic> toJson() {
    return {
      'auction_pic_url': auctionPicUrl,
      'category': category,
      'current_bid': currentBid,
      'deadline': deadline,
      'description': description,
      'owner_name': ownerName,
      'owner_profile_pic_url': ownerProfilePicUrl,
      'title': title,
      'total_bids': totalBids,
    };
  }
}
