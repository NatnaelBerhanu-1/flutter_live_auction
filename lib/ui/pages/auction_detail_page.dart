import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:live_auction/constants.dart';
import 'package:live_auction/core/models/auction.dart';
import 'package:live_auction/core/viewModels/auction_viewmodel.dart';
import 'package:live_auction/ui/shared/owner_widget.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

import 'cover_image_view_page.dart';

class AuctionDetailPage extends StatefulWidget {
  static final String pageName = "auctionDetail";
  @override
  State<AuctionDetailPage> createState() {
    return _AuctionDetailPage();
  }
}

class _AuctionDetailPage extends State<AuctionDetailPage> {

  double bidAmount = 0;

  @override
  Widget build(BuildContext context) {
    final auctionProvider =
        Provider.of<AuctionViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: kBackgroundColorLight,
      body: SafeArea(
        child: StreamBuilder(
          /// Embedded the document id for demo purpose
          stream: auctionProvider.getAuctionAsStream("RtiyvrTaDBEtBvq9n7gc"),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              Auction auction = Auction.fromJson(
                  snapshot.data!.data() as Map<String, dynamic>);
              print(auction);
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0, bottom: 120.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _backButton(),
                          SizedBox(
                            height: 25.0,
                          ),
                          _coverSection(context, auction),
                          SizedBox(
                            height: 15.0,
                          ),
                          _detailSection(context, auction),
                        ],
                      ),
                    ),
                  ),
                  _footerSection(auction),
                ],
              );
            } else {
              return _loadingWidget(context);
            }
          },
        ),
      ),
    );
  }

  _loadingWidget(context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 120.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _backButton(),
            SizedBox(
              height: 25.0,
            ),
            Shimmer.fromColors(
              baseColor: Colors.black26,
              highlightColor: Colors.black12,
              direction: ShimmerDirection.ltr,
              enabled: true,
              child: Container(
                width: kScreenWidth(context),
                height: 350,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            // _detailSection(context, auction),
            Shimmer.fromColors(
              baseColor: Colors.black26,
              highlightColor: Colors.black12,
              direction: ShimmerDirection.ltr,
              enabled: true,
              child: Container(
                width: kScreenWidth(context) / 2,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.black26,
                  highlightColor: Colors.black12,
                  direction: ShimmerDirection.ltr,
                  enabled: true,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.black26,
                      highlightColor: Colors.black12,
                      direction: ShimmerDirection.ltr,
                      enabled: true,
                      child: Container(
                        width: 60,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.black26,
                      highlightColor: Colors.black12,
                      direction: ShimmerDirection.ltr,
                      enabled: true,
                      child: Container(
                        width: 110,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Shimmer.fromColors(
              baseColor: Colors.black26,
              highlightColor: Colors.black12,
              direction: ShimmerDirection.ltr,
              enabled: true,
              child: Container(
                width: 150,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Shimmer.fromColors(
              baseColor: Colors.black26,
              highlightColor: Colors.black12,
              direction: ShimmerDirection.ltr,
              enabled: true,
              child: Container(
                width: kScreenWidth(context),
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
              baseColor: Colors.black26,
              highlightColor: Colors.black12,
              direction: ShimmerDirection.ltr,
              enabled: true,
              child: Container(
                width: kScreenWidth(context) / 2,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _footerSection(Auction auction) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 100,
        width: kScreenWidth(context),
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Bid",
                  style: TextStyle(fontSize: 16.0, color: Colors.black54),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "1.44 ETH",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => _placeBidModal(context, auction),
                    isScrollControlled: true);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                decoration: BoxDecoration(
                    color: kBlackColor,
                    borderRadius: BorderRadius.circular(50.0)),
                child: Text(
                  "Place a Bid",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22.0,
                      color: Colors.white),
                ),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.zero),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ))),
            )
          ],
        ),
      ),
    );
  }

  _backButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back, color: kBlackColor),
    );
  }

  _coverSection(BuildContext context, Auction auction) {
    return Stack(
      children: [
        Container(
          height: 350,
          width: kScreenWidth(context),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(20.0)),
          child: Hero(
            tag: auction.auctionPicUrl,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  auction.auctionPicUrl,
                  filterQuality: FilterQuality.none,
                  errorBuilder: (context, error, stackTrace) =>
                      Center(child: Text("Couldn't load image.")),
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 7.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: kCoverImageTagBgColor,
            ),
            child: Text(
              auction.category,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          child: _coverBottomSection(auction),
          bottom: 20,
          width: kScreenWidth(context) - 40,
        ),
      ],
    );
  }

  Widget _coverBottomSection(Auction auction) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          CountdownTimer(
            endTime: auction.deadline.microsecondsSinceEpoch,
            widgetBuilder: (_, CurrentRemainingTime? time) => Container(
              decoration: BoxDecoration(
                  color: time == null ? kRedColor : kAccentColorBright,
                  borderRadius: BorderRadius.circular(20.0)),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: time == null
                  ? Text(
                      'Closed',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    )
                  : Text(
                      "${time.hours != null ? time.hours : '00'} : ${time.min != null ? time.min : '00'} : ${time.sec != null ? time.sec : '00'}",
                      style: TextStyle(
                          color: kTextBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
            ),
            onEnd: () {
              setState(() {});
            },
          ),
          Row(
            children: [
              _coverFloatingBtn(icon: Icons.favorite_outline),
              SizedBox(width: 10),
              _coverFloatingBtn(icon: Icons.ios_share),
              SizedBox(width: 10),
              GestureDetector(
                child: _coverFloatingBtn(icon: Icons.fullscreen_rounded),
                onTap: () {
                  Navigator.pushNamed(context, CoverImageViewPage.pageName,
                      arguments: auction.auctionPicUrl);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _coverFloatingBtn({IconData? icon}) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: kBlackColor.withOpacity(0.7)),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  _detailSection(BuildContext context, Auction auction) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          auction.title,
          style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 15.0,
        ),
        OwnerWidget(auction: auction),
        SizedBox(
          height: 15.0,
        ),
        Text(
          "Description",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15.0,
        ),
        ReadMoreText(
          auction.description,
          trimLines: 2,
          trimMode: TrimMode.Line,
          colorClickableText: Colors.black,
          trimCollapsedText: "Read More",
          trimExpandedText: "Read Less",
          delimiter: "...",
          moreStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          lessStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          style: TextStyle(fontSize: 16.0, color: Colors.black54),
        ),
      ],
    );
  }

  _placeBidModal(BuildContext context, Auction auction) {
    return Container(
      color: Colors.white,
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current Bid",
                      style: TextStyle(fontSize: 16.0, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${auction.currentBid} ETH",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Text(
                  "${auction.totalBids} Bids",
                  style: TextStyle(fontSize: 16.0, color: Colors.black54),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Text(
              "Your Bid",
              style: TextStyle(fontSize: 16.0, color: Colors.black54),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value){
                bidAmount = double.parse(value);
              },
              decoration: InputDecoration(
                  hintText: "ETH 1.45",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kBlackColor.withOpacity(.5))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kAccentColor))),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async{
                if(bidAmount < auction.currentBid){
                  EasyLoading.showError("You bid lower than\nthe current bid.", duration: Duration(seconds: 2), maskType: EasyLoadingMaskType.black,dismissOnTap: false,);
                  return;
                }
                /// Mocking placing bid
                EasyLoading.show(status: "Placing your bid", maskType: EasyLoadingMaskType.black, dismissOnTap: false);
                await Future.delayed(Duration(seconds: 4));
                EasyLoading.dismiss();
                Navigator.pop(context);
                EasyLoading.showSuccess("Completed", duration: Duration(seconds: 1), maskType: EasyLoadingMaskType.black,dismissOnTap: false,);

              },
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.black87),
                child: Center(
                  child: Text(
                    "SUBMIT BID",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
