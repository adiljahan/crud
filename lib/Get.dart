import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Constand/Constand_color.dart';
import 'main.dart';

class Get extends StatefulWidget {
  final String id;
  const Get({super.key, required this.id});

  @override
  State<Get> createState() => _GetState();
}

class _GetState extends State<Get> {
  List GetCollection = [];
  Map<String,dynamic>getdoument={};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      QuerySnapshot<Map<String, dynamic>> getdata =
                          await FirebaseFirestore.instance
                              .collection("users")
                              .get();
                      GetCollection = getdata.docs;
                      DocumentSnapshot<Map<String,dynamic>>docdata=
                      await FirebaseFirestore.instance.collection("users").doc(widget.id).get();
                      getdoument=docdata.data()!;

                      setState(() {});
                    },
                    child: Container(
                      height: w * 0.12,
                      width: w * 0.3,
                      decoration: BoxDecoration(
                          color: ColorConst.white,
                          borderRadius: BorderRadius.circular(w * 0.06),
                          border: Border.all(
                              color: ColorConst.blue, width: w * 0.005)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get",
                            style: TextStyle(
                                color: ColorConst.blue,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: w*0.2,
                width: w*1,
                color: Colors.lightGreen,
                child: Column(
                  children: [
                    Text(getdoument["name"]??""),
                    Text(getdoument["email"]??""),
                  ],

                ),
              ),
              Container(
                height: w * 1.9,
                width: w * 1,
                child: ListView.separated(

                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(
                          w * 0.03,
                        ),
                        child: Container(
                          height: w * 0.2,
                          width: w * 0.33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w * 0.04),
                              color: ColorConst.lightgrey),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(GetCollection[index]["name"]),
                              Text(GetCollection[index]["email"]),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: w * 0.0001,
                      );
                    },
                    itemCount: GetCollection.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
