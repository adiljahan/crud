import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Add_User.dart';
import 'package:crud/Constand/Constand_color.dart';
import 'package:crud/Constand/constant_image.dart';
import 'package:crud/Edit_User.dart';
import 'package:crud/Get.dart';
import 'package:crud/Login_login.dart';
import 'package:crud/Login_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'main.dart';

class homepage_2 extends StatefulWidget {
  const homepage_2({super.key});

  @override
  State<homepage_2> createState() => _homepage_2State();
}

class _homepage_2State extends State<homepage_2> {
  // List a=[
  //   {
  //     "image":imageconstant.albert,
  //     "text1":"Albert Flores",
  //     "text2":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon1":imageconstant.Reddelete,
  //     "icon2":imageconstant.Pensil,
  //   },
  //   {
  //     "image":imageconstant.albert,
  //     "text1":"Albert Flores",
  //     "text2":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon1":imageconstant.Reddelete,
  //     "icon2":imageconstant.Pensil
  //   },
  //   {
  //     "image":imageconstant.albert,
  //     "text1":"Albert Flores",
  //     "text2":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon1":imageconstant.Reddelete,
  //     "icon2":imageconstant.bluepensil,
  //   },
  //   {
  //     "image":imageconstant.albert,
  //     "text1":"Albert Flores",
  //     "text2":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon1":imageconstant.Reddelete,
  //     "icon2":imageconstant.bluepensil,
  //   },
  //   {
  //     "image":imageconstant.albert,
  //     "text1":"Albert Flores",
  //     "text2":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon1":imageconstant.Reddelete,
  //     "icon2":imageconstant.bluepensil,
  //   },
  //   {
  //     "image":imageconstant.albert,
  //     "text1":"Albert Flores",
  //     "text2":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon1":imageconstant.Reddelete,
  //     "icon2":imageconstant.bluepensil,
  //   },
  //   {
  //     "image":imageconstant.albert,
  //     "text1":"Albert Flores",
  //     "text2":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon1":imageconstant.Reddelete,
  //     "icon2":imageconstant.bluepensil,
  //   },
  //   {
  //     "image":imageconstant.albert,
  //     "text1":"Albert Flores",
  //     "text2":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon1":imageconstant.Reddelete,
  //     "icon2":imageconstant.bluepensil,
  //   },
  //
  // ];
  bool b = false;
  bool c = false;
  bool d = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (ctx) => Add_user()));
        },
        backgroundColor: ColorConst.Darkblue,
        child: Icon(
          Icons.add,
          color: Colors.indigo,
        ),
      ),
      appBar: AppBar(
        backgroundColor: ColorConst.white,
        automaticallyImplyLeading: false,
        elevation: 0,
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
                Image(
                  image: AssetImage(
                    imageconstant.man,
                  ),
                  width: w * 0.095,
                ),
                SizedBox(
                  width: w * 0.025,
                ),
                InkWell(
                    onTap: () {
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
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w * 0.045),
                  child: Text(
                    "Current Users",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(userId)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      var data = snapshot.data!.data();
                      return Column(
                        children: [
                          Text(data!["name"]),
                          Text(data["email"]),
                        ],
                      );
                    })
              ],
            ),
            SizedBox(
              height: w * 0.02,
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream:
                    FirebaseFirestore.instance.collection("users").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var data = snapshot.data!.docs;
                  return ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Get(
                                        id: data[index].id,
                                      ),
                                    ));
                              },
                              child: Container(
                                  height: w * 0.2,
                                  width: w * 0.93,
                                  decoration: BoxDecoration(
                                    color: ColorConst.lightgrey,
                                    borderRadius:
                                        BorderRadius.circular(w * 0.03),
                                  ),
                                  child: ListTile(
                                      leading: CircleAvatar(
                                        radius: w * 0.03,
                                        backgroundImage:
                                            NetworkImage(data[index]["image"]),
                                      ),
                                      title: Text(
                                        data[index]["name"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: ColorConst.black),
                                      ),
                                      subtitle: Text(
                                        data[index]["email"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                b = false;
                                                c = true;
                                                d = false;
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text("Are you sure"),
                                                          Text(
                                                              "you want to delete User?")
                                                        ],
                                                      ),
                                                      content: SizedBox(
                                                        height: h * 0.1,
                                                        width: w * 0.05,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Divider(
                                                              thickness: 0.2,
                                                              color: ColorConst
                                                                  .black,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        "users")
                                                                    .doc(data[
                                                                            index]
                                                                        [
                                                                        "email"])
                                                                    .delete();
                                                              },
                                                              child: Container(
                                                                height:
                                                                    w * 0.07,
                                                                width: w * 0.1,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(w *
                                                                              0.03),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "YES",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 0.2,
                                                              color: ColorConst
                                                                  .black,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                height:
                                                                    w * 0.044,
                                                                width: w * 0.4,
                                                                child: Center(
                                                                  child: Text(
                                                                      "Cancel",
                                                                      style: TextStyle(
                                                                          color: ColorConst
                                                                              .blue,
                                                                          fontSize:
                                                                              17)),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: w * 0.05,
                                                width: w * 0.06,
                                                // color: Colors.red,
                                                child: SvgPicture.asset(
                                                    imageconstant.Reddelete),
                                              )),
                                          SizedBox(
                                            width: w * 0.022,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Edit_user(
                                                        userId: data[index]
                                                            ["email"],
                                                        name: data[index]
                                                            ["name"],
                                                        email: data[index]
                                                            ["email"],
                                                        password: data[index]
                                                            ["password"],
                                                        image: data[index]
                                                            ["image"],
                                                      ),
                                                    ));
                                              },
                                              child: Container(
                                                height: w * 0.05,
                                                width: w * 0.07,
                                                // color: Colors.red,
                                                child: SvgPicture.asset(
                                                  imageconstant.Pensil,
                                                  width: w * 0.05,
                                                ),
                                              ))
                                        ],
                                      ))),
                            ),
                            SizedBox(
                              height: w * 0.02,
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: w * 0.03,
                        );
                      },
                      itemCount: data.length);
                })
          ],
        ),
      ),
    );
  }
}
