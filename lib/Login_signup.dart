import 'package:crud/Constand/Constand_color.dart';
import 'package:crud/Constand/constant_image.dart';
import 'package:crud/Login_login.dart';
import 'package:crud/Sign_up.dart';
import 'package:crud/main.dart';
import 'package:flutter/material.dart';

class login_signup extends StatefulWidget {
  const login_signup({super.key});

  @override
  State<login_signup> createState() => _login_signupState();
}

class _login_signupState extends State<login_signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              SizedBox(
                height: h * 0.03,
              ),
              Padding(
                padding: EdgeInsets.all(w * 0.05),
                child: Container(
                    height: w * 1,
                    width: w * 0.9,
                    child: Image.asset(imageconstant.loginsingup)),
              )
            ],
          ),
          Column(
            children: [
              Text(
                "CRUD",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: w * 0.08,
                    color: ColorConst.Darkblue),
              ),
              SizedBox(height: w * 0.03),
              Text(
                "Create, Read, Update ,Delete",
                style: TextStyle(color: ColorConst.Darkblue),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: w * 0.1,
                width: w * 0.5,
                decoration: BoxDecoration(
                    color: ColorConst.Darkblue,
                    borderRadius: BorderRadius.circular(w * 0.05)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ));
                  },
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: ColorConst.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.04,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sing_up(),
                      ));
                },
                child: Container(
                  height: w * 0.1,
                  width: w * 0.5,
                  decoration: BoxDecoration(
                      color: ColorConst.white,
                      borderRadius: BorderRadius.circular(w * 0.05),
                      border: Border.all(color: ColorConst.Darkblue)),
                  child: Center(
                    child: Text(
                      "sign up",
                      style: TextStyle(
                          color: ColorConst.Darkblue,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
