import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crud/Api.dart';
import 'package:crud/Constand/Constand_color.dart';
import 'package:crud/Constand/constant_image.dart';
import 'package:crud/Home_page2.dart';
import 'package:crud/Login_signup.dart';
import 'package:crud/banner.dart';
import 'package:crud/profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'main.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => Home_pageState();
}

class Home_pageState extends State<Home_page> {
  List images = [
    {
      "image": imageconstant.Camraphoto,
      "image": imageconstant.Camraphoto,
      "image": imageconstant.Camraphoto
    },
    {
      "image": imageconstant.Camraphoto,
      "image": imageconstant.Camraphoto,
      "image": imageconstant.Camraphoto
    },
    {
      "image": imageconstant.Camraphoto,
      "image": imageconstant.Camraphoto,
      "image": imageconstant.Camraphoto,
    },
  ];

  // int initialindex=0;
  int activeIndex = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConst.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hello, User",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: ColorConst.black),
              ),
              Row(
                children: [
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => profile(),));
                  },
                    child: Image(
                      image: AssetImage(
                        imageconstant.man,
                      ),
                      width: w * 0.095,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.025,
                  ),
                  InkWell(
                      onTap: () async {
                        SharedPreferences adil = await SharedPreferences.getInstance();
                        await adil.remove('login'
                            ''
                            ''
                            ''
                            ''
                            ''
                            ''
                            '');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => login_signup(),
                            ));
                      },
                      child: Icon(
                        Icons.logout,
                        color: ColorConst.black,
                      )),
                ],
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(w * 0.03),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  CarouselSlider(
                      items: List.generate(
                          images.length,
                          (index) => Container(
                                height: w * 0.04,
                                width: w * 0.8,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.circular(w * 0.03)),
                                child: Image(
                                  image: AssetImage(
                                    images[index]['image'],
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              )),
                      options: CarouselOptions(
                          height: 200,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          onPageChanged: (index, reason) {
                            activeIndex = index;
                            setState(() {
                              print(index);
                            });
                          },
                          scrollDirection: Axis.horizontal)),
                  AnimatedSmoothIndicator(
                    effect: JumpingDotEffect(verticalOffset: 20),
                    activeIndex: activeIndex,
                    count: images.length,
                  )
                ],
              ),
            ),
            SizedBox(
              height: w * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => homepage_2(),
                            ));
                      },
                      child: Container(
                        height: w * 0.4,
                        width: w * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurStyle: BlurStyle.normal,
                                  color: Colors.black.withOpacity(0.09),
                                  offset: Offset(0, 4),
                                  spreadRadius: 15,
                                  blurRadius: 15)
                            ],
                            borderRadius: BorderRadius.circular(w * 0.07)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(w * 0.05),
                              child: Image(
                                image: AssetImage(
                                  imageconstant.Yellowthoni,
                                ),
                                width: w * 0.13,
                              ),
                            ),
                            Text(
                              "CRUD",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 22),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => banner(),
                        ));
                  },
                  child: Container(
                    height: w * 0.4,
                    width: w * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurStyle: BlurStyle.normal,
                              color: Colors.black.withOpacity(0.07),
                              offset: Offset(0, 4),
                              spreadRadius: 15,
                              blurRadius: 15),
                        ],
                        borderRadius: BorderRadius.circular(w * 0.09)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(w * 0.05),
                          child: Stack(children: [
                            Image(
                              image: AssetImage(
                                imageconstant.Yellowthoni,
                              ),
                              width: w * 0.12,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: w * 0.093, left: w * 0.073),
                              child: CircleAvatar(
                                radius: w * 0.04,
                                backgroundColor: ColorConst.lightgrey,
                                child: Center(child: Icon(Icons.image)),
                              ),
                            )
                          ]),
                        ),
                        Text(
                          "Cloud Storage",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: ColorConst.black),
                        ),
                        Text(
                          "for Firebase",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: ColorConst.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w * 0.08, top: w * 0.06),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => API(),
                          ));
                    },
                    child: Container(
                      height: w * 0.4,
                      width: w * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurStyle: BlurStyle.normal,
                                color: Colors.black.withOpacity(0.09),
                                offset: Offset(0, 4),
                                spreadRadius: 15,
                                blurRadius: 15)
                          ],
                          borderRadius: BorderRadius.circular(w * 0.07)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(w * 0.02),
                            child: Image(
                              image: AssetImage(
                                imageconstant.world,
                              ),
                              width: w * 0.25,
                            ),
                          ),
                          Text(
                            "API",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
