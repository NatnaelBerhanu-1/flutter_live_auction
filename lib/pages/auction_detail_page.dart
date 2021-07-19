import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:live_auction/constants.dart';
import 'package:readmore/readmore.dart';

class AuctionDetailPage extends StatefulWidget {
  static final String pageName = "auctionDetail";
  @override
  State<AuctionDetailPage> createState() {
    return _AuctionDetailPage();
  }
}

class _AuctionDetailPage extends State<AuctionDetailPage> {
  int _endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColorLight,
      body: SafeArea(
        child: Stack(
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
                      height: 15.0,
                    ),
                    _coverSection(context),
                    SizedBox(
                      height: 15.0,
                    ),
                    _detailSection(context),
                  ],
                ),
              ),
            ),
            _footerSection(),
          ],
        ),
      ),
    );
  }

  _footerSection() {
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
            TextButton(onPressed: () {
              showModalBottomSheet(context: context, builder: (context) => _placeBidModal(context), isScrollControlled: true);
            }, child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
              decoration: BoxDecoration(
                color: kBlackColor,
                borderRadius: BorderRadius.circular(50.0)
              ),
              child: Text("Place a Bid", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.0, color: Colors.white),),
            ),style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
               EdgeInsets.zero
              ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                    )
                )
            ),)
          ],
        ),
      ),
    );
  }

  _backButton() {
    return GestureDetector(
      onTap: () {},
      child: Icon(Icons.arrow_back, color: kBlackColor),
    );
  }

  _coverSection(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 350,
          width: kScreenWidth(context),
          decoration: BoxDecoration(
              color: kAccentColor, borderRadius: BorderRadius.circular(20.0)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                "assets/images/sample_art_two.jpg",
                fit: BoxFit.cover,
              )),
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
              "Art",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          child: _coverBottomSection(),
          bottom: 20,
          width: kScreenWidth(context) - 40,
        ),
      ],
    );
  }

  Widget _coverBottomSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          CountdownTimer(
            endTime: _endTime,
            widgetBuilder: (_, CurrentRemainingTime? time) => Container(
              decoration: BoxDecoration(
                  color: time == null ? kRedColor : kAccentColorBright,
                  borderRadius: BorderRadius.circular(20.0)),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child:
                  time == null ?
                    Text('Closed',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),)
                  :
                  Text(
                    "${time.hours != null ? time.hours : '00'} : ${time.min != null ? time.min : '00'} : ${time.sec != null ? time.sec : '00'}",
                    style: TextStyle(
                        color: kTextBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
            ),
            onEnd: (){
              setState(() {

              });
            },
          ),
          Row(
            children: [
              _coverFloatingBtn(icon: Icons.favorite_outline),
              SizedBox(width: 10),
              _coverFloatingBtn(icon: Icons.ios_share),
              SizedBox(width: 10),
              _coverFloatingBtn(icon: Icons.fullscreen_rounded),
            ],
          )
        ],
      ),
    );
  }

  _coverFloatingBtn({IconData? icon}) {
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

  _detailSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Abstract Liquid",
          style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 15.0,
        ),
        _ownerWidget(),
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
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et nisl nibh. In in nunc viverra tortor dignissim malesuada eu vitae augue. Cras eu quam eget augue pretium condimentum. Suspendisse potenti. Curabitur id risus hendrerit, viverra ipsum tempus, volutpat metus. Quisque pellentesque erat a interdum laoreet.",
          trimLines: 2,
          trimMode: TrimMode.Line,
          colorClickableText: Colors.black,
          trimCollapsedText: "Read More",
          trimExpandedText: "Read Less",
          moreStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          lessStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          style: TextStyle(fontSize: 16.0, color: Colors.black54),
        ),
      ],
    );
  }

  _ownerWidget() {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage("assets/images/sample_face.jpg"),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Owner",
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Jenny Wilson",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            )
          ],
        )
      ],
    );
  }

  _placeBidModal(BuildContext context) {
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
                      "1.44 ETH",
                      style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Text(
                  "11 Bids",
                  style: TextStyle(fontSize: 16.0, color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Divider(),
            SizedBox(height: 10,),
            Text(
              "Your Bid",
              style: TextStyle(fontSize: 16.0, color: Colors.black54),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "ETH 1.45",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kBackgroundColorLight
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: kAccentColor
                    )
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height:60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.black87
              ),
              child: Center(
                child: Text("SUBMIT BID", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
