
import 'package:crud/Constand/Constand_color.dart';
import 'package:crud/Constand/constant_image.dart';
import 'package:crud/OTP.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

class banner extends StatefulWidget {
  const banner({super.key});

  @override
  State<banner> createState() => _bannerState();
}

class _bannerState extends State<banner> {
  TextEditingController NameController=TextEditingController();
  List banner=[
    {
      "image":imageconstant.Book,
      "text1":"Banner 1",
      "text2":"2 May",
      "icon":imageconstant.Reddelete,
    },
    {
      "image":imageconstant.Camraphoto,
      "text1":"Banner 2",
      "text2":"2 May",
      "icon":imageconstant.Reddelete,
    },
    {
      "image":imageconstant.Book,
      "text1":"Banner 3",
      "text2":"2 May",
      "icon":imageconstant.Reddelete,
    },
  ];
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
          title: Text("Banner",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22
            ),),
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: w*0.05,),
                Center(
                  child: DottedBorder(
                    // customPath: (size) => customPath, // PathBuilder
                    color: ColorConst.Darkblue,
                    dashPattern: [12, 5],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    strokeWidth: 2,
                    child: Container(
                      height: w*0.55,
                      width: w*0.88,
                      decoration: BoxDecoration(
                          color:ColorConst.white,
                          borderRadius: BorderRadius.circular(w*0.03)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage(imageconstant.Bannerphoto),width: w*0.3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Click here to Upload"),
                              SizedBox(width: w*0.015,),
                              Text("Image",style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color:  ColorConst.Darkblue,
                              ),)
                            ],
                          ),
                          SizedBox(height: w*0.015,),
                          Text("Supports: PNG, JPG, JPEG, WEBP",style: TextStyle(fontSize: 10,color: ColorConst.lightgrey),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: w*0.05,),
                Container(
                    height: w*0.15,
                    width: w*0.9,
                    child:
                    TextFormField(
                        controller: NameController,
                        keyboardType:TextInputType.name ,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "    Title    ",
                          labelStyle: TextStyle(
                              fontSize: w*0.05,
                              fontWeight: FontWeight.w400,color: ColorConst.Darkblue,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(w*0.03),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorConst.Darkblue,
                            ),
                            borderRadius: BorderRadius.circular(w*0.03),
                          ),
                        )
                    )),
                SizedBox(height: w*0.05,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(
                      builder: (context) => OTP(number: '',),));
                  },
                  child: Container(
                    height: w*0.13,
                    width: w*0.7,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConst.Darkblue,),
                      borderRadius: BorderRadius.circular(w*0.03),
                    ),
                    child: Center(
                      child: Text("Upload Banner",style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: ColorConst.Darkblue,
                      ),),
                    ),
                  ),
                ),
                SizedBox(height: w*0.05,),
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: w*0.25,
                            width: w*0.9,
                            decoration: BoxDecoration(
                                color: ColorConst.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurStyle: BlurStyle.normal,
                                    // color: Colors.grey.shade100,
                                    color:  ColorConst.grey.withOpacity(0.07),
                                    offset: const Offset(0, 5),
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(w*0.05)
                            ),
                            child: Center(
                              child: ListTile(
                                leading: Image(image: AssetImage(banner[index]["image"])),
                                title:Container(
                                  height: w*0.093,
                                  width: w*0.05,
                                  child: Text(banner[index]["text1"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: ColorConst.blue
                                    ),),
                                ),
                                subtitle:Text(banner[index]["text2"],style: TextStyle(fontSize: 16),),
                                trailing: SvgPicture.asset(banner[index]["icon"]),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: w*0.03,
                      );
                    },
                    itemCount:banner.length)
              ],
            ),
            ),
        );
    }
}
