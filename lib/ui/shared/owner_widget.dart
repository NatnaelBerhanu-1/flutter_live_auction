import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_auction/core/models/auction.dart';

class OwnerWidget extends StatelessWidget {
  final Auction auction;
  final light;

  OwnerWidget({required this.auction, this.light = true});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(auction.ownerProfilePicUrl),
          backgroundColor: light ? Colors.black12 : Colors.white54,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Owner",
              style: TextStyle(color: light ? Colors.black54 : Colors.white),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              auction.ownerName,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,color: light ? Colors.black : Colors.white),
            )
          ],
        )
      ],
    );
  }
}