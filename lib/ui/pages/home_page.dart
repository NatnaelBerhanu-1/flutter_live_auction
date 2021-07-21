import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live_auction/constants.dart';
import 'package:live_auction/core/models/auction.dart';
import 'package:live_auction/core/models/seller.dart';
import 'package:live_auction/ui/pages/auction_detail_page.dart';
import 'package:live_auction/ui/shared/owner_widget.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  static final String pageName = "homePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["Art", "Music", "Gaming", "Sport", "Other"];

  List<Seller> sellers = [
    Seller(
        fullName: "Eleanor Pena",
        balance: 0.000053,
        picUrl: "assets/images/sample_face.jpg",
        rising: true),
    Seller(
        fullName: "Leslie Alexander",
        balance: 0.000050,
        picUrl: "assets/images/sample_face2.jpg",
        rising: false),
    Seller(
        fullName: "Theresa Webb",
        balance: 0.000048,
        picUrl: "assets/images/sample_face.jpg",
        rising: true),
  ];

  List<Auction> _featuredAuctions = [
    Auction(
      totalBids: 1,
      title: "Abstract Liquid",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet at tellus nec scelerisque. Donec a lobortis ipsum. In ullamcorper, tellus sed mattis ullamcorper, orci nisl sagittis lectus, ac posuere quam felis vitae lectus. Duis ornare rhoncus tellus eu posuere. Phasellus consequat ligula quis tortor mattis eleifend.",
      auctionPicUrl: "https://images.unsplash.com/photo-1589753345288-f86191e89ad7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjZ8fGFydHxlbnwwfDF8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      category: "Art",
      currentBid: 1.44,
      deadline: Timestamp.now(),
      ownerName: "Jenny Wilson",
      ownerProfilePicUrl: "https://images.unsplash.com/photo-1485893086445-ed75865251e0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8d29tYW4lMjBmYWNlfGVufDB8MnwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    )
  ];

  late String _activeCat;

  @override
  void initState() {
    _activeCat = categories[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColorLight,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: _appBar()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Live Auctions",
                style: _titleTextStyle(),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            _categoriesSection(),
            SizedBox(
              height: 20.0,
            ),
            _featuredSection(),
            SizedBox(
              height: 20.0,
            ),
            _topSellersSection(),
          ],
        ),
      )),
    );
  }

  TextStyle _titleTextStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
  }

  Widget _appBar() {
    return Row(
      children: [
        Icon(
          Icons.widgets_outlined,
          color: Colors.black45,
          size: 25,
        ),
        Spacer(),
        Icon(
          Icons.search,
          color: Colors.black45,
          size: 25,
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.notifications_outlined,
          color: Colors.black45,
          size: 25,
        ),
      ],
    );
  }

  _categoriesSection() {
    return Container(
      height: 30,
      padding: EdgeInsets.only(left: 20.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [...categories.map((e) => _categoryItem("$e")).toList()],
      ),
    );
  }

  _categoryItem(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeCat = title;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
            color: _activeCat == title ? kAccentColor : Colors.white,
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          title,
          style: TextStyle(
              fontWeight:
                  _activeCat == title ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
              color: _activeCat == title ? Colors.white : kAccentColor),
        ),
      ),
    );
  }

  Widget _featuredSection() {
    return Container(
      height: 240,
      child: CarouselSlider(
        items: _featuredAuctions.map((e) => _carouselItem(e)).toList(),
        options: CarouselOptions(
          height: 300,
          enlargeCenterPage: true
        ),
      ),
    );
  }

  Widget _carouselItem(Auction auction){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AuctionDetailPage.pageName);
      },
      child: Container(
        child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 16)
                      )
                    ]
                ),
                child: ClipRRect(
                  child: Image.asset("assets/images/sample_art_two.jpg", width: kScreenWidth(context), height: 200,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.5),
                      ],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Abstract Liquid", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color:Colors.white),),
                      SizedBox(height: 10,),
                      OwnerWidget(auction: auction, light: false,)
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }

  Widget _topSellersSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Sellers",
            style: _titleTextStyle(),
          ),
          SizedBox(
            height: 20,
          ),
          ...sellers.map((e) => _seller(e)).toList()
        ],
      ),
    );
  }

  Widget _seller(Seller seller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(seller.picUrl),
            backgroundColor: Colors.black12,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                seller.fullName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "${seller.balance} BTC",
                style: TextStyle(color: Colors.black54, fontSize: 15),
              )
            ],
          ),
          Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: seller.rising ? kAccentColor : kRedColor),
            child: Center(
              child: Icon(
                seller.rising ? Icons.arrow_upward : Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
