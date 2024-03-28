import 'package:crud/Constand/Constand_color.dart';
import 'package:crud/Constand/constant_image.dart';
import 'package:crud/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

import 'main.dart';

class OTP extends StatefulWidget {
  final String number;
  const OTP({super.key, required this.number});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConst.white,
      appBar: AppBar(


        elevation: 0,
        backgroundColor: ColorConst.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: w * 0.04,
            width: w * 0.08,

            child: Padding(
              padding: EdgeInsets.all(w * 0.03),
              child: SvgPicture.asset(
                imageconstant.Back,
              ),
            ),
          ),
        ),
        title: Text(
          "Verify OTP",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: w * 0.03,
            ),
            Image(image: AssetImage(imageconstant.OTPphoto)),
            SizedBox(
              height: w * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "OTP has been sent to",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorConst.grey),
                ),
                SvgPicture.asset(imageconstant.Pensil)
              ],
            ),
            SizedBox(
              height: w * 0.03,
            ),
            Pinput(
              length: 5,
            ),
            Container(
              height: w * 0.23,
              width: w * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Home_page(),) );
                  },

                    child: Container(
                      height: w * 0.11,
                      width: w * 0.5,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorConst.Darkblue),
                          borderRadius: BorderRadius.circular(w * 0.06)),
                      child: Center(
                        child: Text(
                          "Verify",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: ColorConst.Darkblue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: w * 0.05,
            ),
            Container(
              height: w * 0.49,
              width: w * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Haven't got the confirmation code yet? "),
                      Text(
                        "Resend",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ColorConst.Darkblue),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Try Another"),
                      Text(
                        "Method?",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: ColorConst.Darkblue),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
