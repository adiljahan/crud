
import 'package:crud/Constand/Constand_color.dart';
import 'package:crud/Home_page.dart';
import 'package:crud/Login_login.dart';
import 'package:crud/Login_signup.dart';
import 'package:crud/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  bool login = false;
  getDate() async {
    SharedPreferences adil = await SharedPreferences.getInstance();
    login = adil.getBool("login") ?? false;
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login==true?Home_page():Login())));
  }

  void initState() {
    getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConst.Darkblue,
      body: Column(
        children: [
          Container(
            height: h * 1,
            child: Center(
              child: Text(
                "CRUD",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: ColorConst.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
