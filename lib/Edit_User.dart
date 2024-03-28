import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Constand/Constand_color.dart';
import 'package:crud/Constand/constant_image.dart';
import 'package:crud/Home_page.dart';
import 'package:crud/Login_signup.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'Home_page2.dart';

class Edit_user extends StatefulWidget {
  final String userId;
  final String name;
  final String email;
  final String image;
  final String password;

  const Edit_user({super.key, required this.userId, required this.name, required this.email, required this.password, required this.image});

  @override
  State<Edit_user> createState() => _Edit_userState();
}

class _Edit_userState extends State<Edit_user> {
  final validatePassword1= RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
  TextEditingController password1 = TextEditingController();
  final validatePassword= RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
  TextEditingController password = TextEditingController();
  final emailValidation = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  TextEditingController emailCondroller = TextEditingController();

  bool a = true;
  bool b = false;
  var file;
  String imgurl="";


  Future<void> pickimage(ImageSource a) async {
    ImagePicker imagePicker = ImagePicker();
    final imamefile = await imagePicker.pickImage(source: a);
    file = File(imamefile!.path);
    if (mounted) {
      file = File(imamefile.path);
      setState(() {});
    }
  }

  TextEditingController namecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController confrimpassword = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    namecontroller.text=widget.name;
    emailcontroller.text=widget.email;
    confrimpassword.text=widget.password;
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 1,
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              setState(() {

              });
            },
            child: Container(
                height: w*0.05,
                width: w*0.05,
                //color: Colors.blueGrey,
                child: Center(child: SvgPicture.asset(imageconstant.Back,))),
          ),
        ),
        backgroundColor: ColorConst.white,
        title: Text("Edit User",
            style: TextStyle(
              color: ColorConst.black,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            )), // TextStyle, Text
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: w * 0.45,
                    width: w * 0.29,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: file == null
                                  ? CircleAvatar(
                                  radius: w * 0.2,
                                  backgroundImage:
                                  NetworkImage(widget.image),
                                  )
                                  : CircleAvatar(
                                radius: w * 0.2,
                                backgroundImage: NetworkImage(imgurl),
                              ),
                            ),
                            Positioned(
                              top: w * 0.25,
                              left: w * 0.22,
                              child: InkWell(
                                onTap: () {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoActionSheet(
                                        actions: [
                                          CupertinoActionSheetAction(
                                              onPressed: () {
                                                pickimage(ImageSource.gallery);
                                                Navigator.pop(context);
                                              },
                                              child: Text("Gallery Photos")),
                                          CupertinoActionSheetAction(
                                              onPressed: () {
                                                pickimage(ImageSource.camera);
                                                Navigator.pop(context);
                                              },
                                              child: Text("Camera")),
                                        ],
                                        cancelButton:
                                        CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Text("cancel"),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: CircleAvatar(
                                  backgroundColor: ColorConst.Darkblue,
                                  radius: w * 0.033,
                                  child: CircleAvatar(
                                    child: SvgPicture.asset(imageconstant.Pensil,
                                        color: Colors.white),
                                    backgroundColor: ColorConst.Darkblue,
                                    radius: w * 0.02,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ])
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(w * 0.05),
                  child: TextFormField(
                      controller: namecontroller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConst.lightgrey,
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.person),
                        hintText: "full name",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                            BorderSide(color: ColorConst.lightgrey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                            BorderSide(color: ColorConst.lightgrey)),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(w * 0.05),
                  child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (emailValidation.hasMatch(value!)) {
                          return null;
                        } else {
                          return "Enter a Valid Email";
                        }
                      },
                      controller: emailcontroller,

                      //controller: email,
                      //autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConst.lightgrey,
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.email),
                        hintText: "valid email",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                            BorderSide(color: ColorConst.lightgrey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                            BorderSide(color: ColorConst.lightgrey)),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(w * 0.05),
                  child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if(validatePassword.hasMatch(value!)){
                          return null;
                        }
                        else{
                          return "Password must contain \n1 Uppercase\n1 Lowercase\n1 Number\n1 Special character";
                        }
                      },
                      controller: confrimpassword,


                      obscureText: a,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConst.lightgrey,
                        border: InputBorder.none,
                        suffixIcon: InkWell(
                            onTap: () {
                              a = !a;
                              setState(() {});
                            },
                            child: Icon(
                                a ? Icons.lock_outlined:Icons.lock_open )),
                        hintText: "password",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                            BorderSide(color: ColorConst.lightgrey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                            BorderSide(color: ColorConst.lightgrey)),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(w * 0.05),
                  child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if(validatePassword1.hasMatch(value!)){
                          return null;
                        }
                        else{
                          return "Password must contain \n1 Uppercase\n1 Lowercase\n1 Number\n1 Special character";
                        }
                      },
                      controller: password1,


                      keyboardType: TextInputType.text,
                      obscureText: b,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConst.lightgrey,
                        border: InputBorder.none,
                        suffixIcon: InkWell(
                            onTap: () {
                              b = !b;
                              setState(() {});
                            },
                            child: Icon(
                                b ? Icons.lock_outlined:Icons.lock_open )),
                        hintText: "confirm passsword",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                            BorderSide(color: ColorConst.lightgrey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                            BorderSide(color: ColorConst.lightgrey)),
                      )),
                ),
              ],
            ),
      InkWell(
        onTap: () {
          showCupertinoModalPopup(context: context, builder: (context) {
            return CupertinoAlertDialog(
              title: Text("Are you Sure \nYou Want to Update Details?"),
              actions: [
                Column(
                  children: [
                    CupertinoDialogAction(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => homepage_2(),));
                          FirebaseFirestore.instance.collection("users").doc(widget.email).update(
                              {
                                "name":namecontroller.text,
                                "email":emailcontroller.text,
                                "password":confrimpassword.text,
                                "image":imgurl
                              });
                          setState(() {

                          });
                        },
                        child: Text("Confirm",)),
                    Divider(),
                    CupertinoDialogAction(child: Text("Cancel",style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.red),),onPressed: (){
                      Navigator.pop(context);
                      setState(() {

                      });
                    }),
                  ],
                )
              ],
            );
          },);
          },

        child: Container(
            height: w * 0.13,
            width: w * 0.7,
            decoration: BoxDecoration(
                color: ColorConst.white,
                borderRadius: BorderRadius.circular(w * 0.06),
                border: Border.all(
                    color: ColorConst.primarycolor, width: w * 0.005)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Edit User",
                  style: TextStyle(
                      color: ColorConst.primarycolor,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
      ),
          ],
        ),
      ),
    );
  }
}
