import 'package:crud/task_page3.dart';
import 'package:flutter/material.dart';

import 'Constand/Constand_color.dart';
import 'main.dart';

class Task extends StatefulWidget {
  const Task({super.key});


  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  TextEditingController nameController=TextEditingController();
  TextEditingController  placeController=TextEditingController();
  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,title: Text("Task1"),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(w * 0.1),
              child: TextFormField(
                controller: nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConst.lightgrey,
                    border: InputBorder.none,

                    hintText: "name",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.04),
                        borderSide:
                        BorderSide(color: ColorConst.lightgrey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.04),
                        borderSide:
                        BorderSide(color: ColorConst.lightgrey)),
                  )),
            ), Padding(
              padding: EdgeInsets.all(w * 0.1),
              child: TextFormField(
                controller: placeController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConst.lightgrey,
                    border: InputBorder.none,

                    hintText: "plase",
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
              InkWell(
                onTap:  () {
                    if(
                  nameController.text !="" &&
                      placeController.text.isNotEmpty &&
                      formkey.currentState!.validate()
                      )
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Task3(),));
                      }
                    else{   nameController.text=="" ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter name"))) :
                    placeController.text.isEmpty ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter address"))) :
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter valid details"))
                    );}
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
                      "Submit",
                      style: TextStyle(
                          color: ColorConst.Darkblue,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )



          ],
        ),
      ),



    );
  }
}
