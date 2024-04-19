
import 'package:crud/Constand/constant_image.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Task3 extends StatefulWidget {
  const Task3({super.key});

  @override
  State<Task3> createState() => _Task3State();
}

List F = [
  {
    "image": imageconstant.KFC,
    "image1": imageconstant.RedLove,

  },
  {
    "image": imageconstant.KFC,
    "image1": imageconstant.RedLove,

  },
  {
    "image": imageconstant.KFC,
    "image1": imageconstant.RedLove,

  },
  {
    "image": imageconstant.KFC,
    "image1": imageconstant.RedLove,

  },
  {
    "image": imageconstant.KFC,
    "image1": imageconstant.RedLove,

  },
  {
    "image": imageconstant.KFC,
    "image1": imageconstant.RedLove,

  },

];
// int total = 0;


List<int> like=[];


class _Task3State extends State<Task3> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.blue,


        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: w*0.1,),
              ListView.separated(
                scrollDirection: Axis.vertical,
                  shrinkWrap: true,

                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(

                        children: [
                         Container(
                           height: w*0.21,
                           width: w*0.88,

                           decoration: BoxDecoration(
                               color: Colors.purple,
                             borderRadius:BorderRadius.circular(Checkbox.width)
                           ),
                           child: Padding(
                             padding:  EdgeInsets.all(w*0.05),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Image.asset(F[index]["image"]),
                                 // InkWell(
                                 //     onTap:() {
                                 //       setState(() {
                                 //         if(like.contains(index)){
                                 //           like.remove(index);
                                 //         }else{
                                 //           like.add(index);
                                 //           print(like);
                                 //         }
                                 //       });
                                 //     },child: like.contains(index)
                                 //    ? SvgPicture.asset(imageconstant.Blacklove,width: w*0.05,color: Colors.white,)
                                 //     : SvgPicture.asset(F[index]["image1"],width: w*0.05,)),



                               ],
                             ),
                           ),
                         )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: w*0.08,
                    );
                  },
                  itemCount: F.length
              )
            ],
          ),
        ),
      ),
    );
  }
}
