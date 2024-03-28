import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Constand/constant_image.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';



class food_page extends StatefulWidget {
  const food_page({super.key});

  @override
  State<food_page> createState() => _food_pageState();
}

List F = [
  {
    "image": imageconstant.KFC,
    "Text": "KFC",
    "price": 299,
    "rating":  imageconstant.Rathing,
    "quantity": 0,
  },
  {
    "image": imageconstant.Burger,
    "Text": "BURGER",
    "price": 199,
    "rating":  imageconstant.Rathing,
    "quantity": 0,
  },
  {
    "image":  imageconstant.biriyani,
    "Text": "BIRIYANI",
    "price": 120,
    "rating": imageconstant.Rathing,
    "quantity": 0,
  },
  {
    "image": imageconstant.Pizza,
    "Text": "PIZZA",
    "price": 399,
    "rating": imageconstant.Rathing,
    "quantity": 0,
  },
  {
    "image": imageconstant.shawarma,
    "Text": "SHAWAYA",
    "price": 249,
    "rating": imageconstant.Rathing,
    "quantity": 0,
  },
  {
    "image": imageconstant.Juice,
    "Text": "SHAWARMA",
    "price": 29,
    "rating": imageconstant.Rathing,
    "quantity": 0,
  },
];
int total = 0;

class _food_pageState extends State<food_page> {
  List<QueryDocumentSnapshot<Map<String,dynamic>>>? getColloection;


  getdata() async {
    await FirebaseFirestore.instance.collection("food").snapshots().listen((event) {
      getColloection=event.docs;
      print(event.docs);
      total = 0;
      for (int i = 0; i < F.length; i++) {
        total = getColloection![i]["quantity"] * getColloection![i]["price"] + total;
      }
    });
  }
  adddata(){
    for(var data in F){
      FirebaseFirestore.instance.collection("food").add(data);

    }
  }
  @override
  void initState() {
    // adddata();
    getdata();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          // floatingActionButton:  Container(
          //   height: width * 0.2,
          //   width: width * 0.9,
          //   // color: Colors.black.withOpacity(0.1),
          //   child: Column(
          //     children: [
          //       Divider(
          //         thickness: width * 0.005,
          //         indent: width * 0.01,
          //         endIndent: width * 0.01,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             "Total price:$total",
          //             style: TextStyle(
          //                 fontWeight: FontWeight.w700,
          //                 color: Colors.black,
          //                 fontSize: width * 0.06),
          //           )
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text(
              "Food Order",
              style: TextStyle(fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),

          ),
          body:
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("food").snapshots(),
            builder: (context, snapshot) {
              var data=snapshot.data!.docs;
              return Container(
                height: h,
                width: w,
                // color: Colors.blue,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              height: h * 0.23,
                              width: w * 1,
                              // color: Colors.yellow,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: w * 0.3,
                                    width: w * 0.3,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(data![index]["image"]),
                                            fit: BoxFit.fill),
                                        color: Colors.red,
                                        borderRadius:
                                        BorderRadius.circular(w* 0.03)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data![index]["Text"],
                                        style: TextStyle(fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                          height: w* 0.08,
                                          width: w * 0.2,
                                          child: Image(
                                              image: AssetImage(data![index]["rating"]))),
                                      Row(
                                        children: [
                                          Text(
                                            "₹ ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            data![index]["price"].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  data![index]["quantity"] != 0
                                      ? Container(
                                      height: w * 0.09,
                                      width: w * 0.22,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(
                                              w * 0.03)),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                setState(() {});

                                                FirebaseFirestore.instance.
                                                collection("food").
                                                doc(data![index].id).update({
                                                  "quantity":data![index]["quantity"]-1
                                                }
                                                );
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              )),
                                          Text(
                                            data![index]["quantity"].toString(),
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                FirebaseFirestore.instance.
                                                collection("food").
                                                doc(data![index].id).update({
                                                  "quantity":data![index]["quantity"]+1
                                                }
                                                );

                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ))
                                        ],
                                      ))
                                      : InkWell(
                                    onTap: () {

                                      FirebaseFirestore.instance.
                                      collection("food").
                                      doc(data![index].id).update({
                                        "quantity":data![index]["quantity"]+1
                                      }
                                      );

                                      setState(() {});
                                    },
                                    child: Container(
                                      height: w * 0.09,
                                      width: w * 0.22,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(
                                              w * 0.03)),
                                      child: Center(
                                        child: Text(
                                          "Add item",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: w * 0.03),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: w * 0.01,
                            );
                          },
                          itemCount: data!.length),
                    ),
                    Container(
                      height: w * 0.2,
                      width: w * 0.9,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Divider(
                            thickness: w * 0.005,
                            indent: w * 0.01,
                            endIndent: w * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total price:₹$total",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontSize: w * 0.06),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },

          ),
        ),
        );
    }
}
