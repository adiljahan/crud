import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Constand/Constand_color.dart';
import 'package:crud/Constand/constant_image.dart';
import 'package:crud/Home_page.dart';
import 'package:crud/Login_signup.dart';
import 'package:crud/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class Sing_up extends StatefulWidget {
  const Sing_up({super.key});

  @override
  State<Sing_up> createState() => _Sing_upState();
}

class _Sing_upState extends State<Sing_up> {
  // final validatePassword1= RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
  // TextEditingController password1 = TextEditingController();
  // final validatePassword= RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
  // TextEditingController password = TextEditingController();
  // final emailValidation = RegExp(
  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  TextEditingController emailCondroller = TextEditingController();
  bool a = true;
  bool b = false;
  var file;
  Future<void> pickimage(ImageSource a) async {
    ImagePicker imagePicker = ImagePicker();
    final imamefile = await imagePicker.pickImage(source: a);
    file = File(imamefile!.path);
    if (mounted) {
      file = File(imamefile.path);
      setState(() {});
    }
  }

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController confrimpassword = TextEditingController();
  @override
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
          title: Text("User Registration",
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
                                    AssetImage(imageconstant.man))
                                    : CircleAvatar(
                                  radius: w * 0.2,
                                  backgroundImage: FileImage(file),
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
                        controller: nameController,
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
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator: (value) {
                        //   if (emailValidation.hasMatch(value!)) {
                        //     return null;
                        //   } else {
                        //     return "Enter a Valid Email";
                        //   }
                        // },
                        // controller: emailCondroller,

                        controller: emailCondroller,
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
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator: (value) {
                        //   if(validatePassword.hasMatch(value!)){
                        //     return null;
                        //   }
                        //   else{
                        //     return "Password must contain \n1 Uppercase\n1 Lowercase\n1 Number\n1 Special character";
                        //   }
                        // },
                        controller: passwordController,


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
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator: (value) {
                        //   if(validatePassword1.hasMatch(value!)){
                        //     return null;
                        //   }
                        //   else{
                        //     return "Password must contain \n1 Uppercase\n1 Lowercase\n1 Number\n1 Special character";
                        //   }
                        // },
                        // controller: passwordController,


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
                  FirebaseAuth.instance.createUserWithEmailAndPassword(

                      email: emailCondroller.text,
                      password: passwordController.text).then((value) {
                    Map<String,dynamic>data={
                      "name":nameController.text,
                      "email":emailCondroller.text,
                      "password":passwordController.text,
                      'id':emailCondroller.text,
                      'image':'',
                    };
                    // FirebaseFirestore.instance.collection("users").add(data);
                    FirebaseFirestore.instance.collection("users").doc(emailCondroller.text).set(data).then((value) {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home_page(),
                          ));
                    }).catchError((error){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));

                    });
                    });

                  setState(() {

                  });

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
                        "sign up",
                        style: TextStyle(
                            color: ColorConst.primarycolor,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: w * 0.08,
              ),
              Padding(
                padding: EdgeInsets.all(w * 0.05),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => login_signup(),
                        ));
                  },
                  child: Container(
                    height: w*0.05,
                    width: w*0.70,
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Account ",
                          style: TextStyle(
                            color: ColorConst.black,
                            // fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          "Login?",
                          style: TextStyle(
                              color: ColorConst.Darkblue,
                              fontWeight: FontWeight.w900,
                              fontSize: w * 0.04),
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            ],
          ),
        ),
        );
    }
}
