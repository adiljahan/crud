import 'package:crud/Constand/Constand_color.dart';
import 'package:crud/task_page2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'main.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();

}

class _splashState extends State<splash> {


  void initState() {


    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) =>Navigator.push(context, MaterialPageRoute(builder: (context) => Task(),)));



  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyanAccent,
        body: Padding(
          padding: EdgeInsets.all(w*0.02),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: w * 0.8,
                    width: w * 1,

                  child: Center(
                    child: Text("Task",style: TextStyle(
                      fontSize: 60,fontWeight: FontWeight.w600,color: Colors.red
                    ),),
                  )

                ),
                SizedBox(height: w*0.04,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [



                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
