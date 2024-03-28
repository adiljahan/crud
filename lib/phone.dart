

import 'package:crud/Constand/Constand_color.dart';
import 'package:crud/Constand/constant_image.dart';
import 'package:crud/OTP.dart';
import 'package:crud/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class phone extends StatefulWidget {
  const phone({super.key});

  @override
  State<phone> createState() => _phoneState();
}

class _phoneState extends State<phone> {
  TextEditingController NumberController=TextEditingController();
  final phoneValidation=RegExp(r"[0-9]{10}$");
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor:ColorConst.white,
          leading: InkWell(
            onTap:  () {
              Navigator.pop(context);
            },
            child: Container(
              height: w*0.05,
              width: w*0.08,
              child: Padding(
                padding:  EdgeInsets.all(w*0.03),
                child: SvgPicture.asset(imageconstant.Back,),
              ),
            ),
          ),
          title: Text("Enter Phone Number",style: TextStyle(color: Colors.black),),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: w*0.05,),
                  Image(image: AssetImage(imageconstant.phone)),
                  SizedBox(height: w*0.05,),
                  Container(
                    height: w*0.19,
                    width: w*0.85,
                    child: IntlPhoneField(
                      controller:NumberController ,
                      // textCapitalization: TextCapitalization.sentences,
                      keyboardType:TextInputType.number ,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10)
                      ],
                      // maxLines:6,
                      // minLines: 2,
                      // maxLength: 4,
                      // obscureText: true,
                      // obscuringCharacter: "*",

                      style: TextStyle(
                          fontSize: w*0.05,
                          fontWeight: FontWeight.w600
                      ),

                      decoration: InputDecoration(

                        labelText: "Number",
                        labelStyle: TextStyle(
                            fontSize: w*0.05,
                            fontWeight: FontWeight.w500,color: Colors.black
                        ),
                        hintText: "Please Enter Your Number",
                        //
                        hintStyle: TextStyle(
                          fontSize: w*0.05,
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(w*0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(w*0.03),
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: w*0.05,),
                  Container(
                    height: w*0.75,
                    width: w*1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: ()
                    {if(NumberController.text!=""&&
                    formKey.currentState!.validate()
                    ) {
                    Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) =>
                    OTP(number: NumberController.text,


                    ),));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("submitted sucsessfully")));
                    }

                    else{NumberController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("plese enter your vaild number"))):
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("plese enter your vaild number")));
                    }

                    },




                          child: Container(
                            height: w*0.11,
                            width: w*0.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorConst.Darkblue),
                                borderRadius: BorderRadius.circular(w*0.06)
                            ),
                            child: Center(
                              child: Text("Send OTP",style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: ColorConst.Darkblue
                              ),),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Sign in with  ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: ColorConst.Darkblue
                              ),),
                            Text(" Another Method ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color:ColorConst.Darkblue
                              ),)
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),

        );



  }}

