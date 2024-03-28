import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Constand/Constand_color.dart';
import 'package:crud/Constand/constant_image.dart';
import 'package:crud/Gogle_sign_firebase.dart';
import 'package:crud/Home_page.dart';
import 'package:crud/Login_login.dart';
import 'package:crud/Sign_up.dart';
import 'package:crud/Splash.dart';
import 'package:crud/main.dart';
import 'package:crud/phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'lib/main.dart';

String userId='';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  googleSignInFunction() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    User? user = userCredential.user;

    print(user!.email);
    print(user!.displayName);
    print(user!.photoURL);

    Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => Home_page(),
        ));
  }

  Future<User?> _handleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential authResult = await _auth.signInWithCredential(credential);
      User? user = authResult.user;

      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  void _handleSignOut() async {
    await googleSignIn.signOut();
    print("User signed out");
  }

  setData() async {
    SharedPreferences adil = await SharedPreferences.getInstance();
    adil.setBool('Login', true);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home_page(),
        ));
  }

  bool a = false;

  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  // final emailvalidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordvalidation =
      RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
  final usernameRegex = RegExp(r'^[a-zA-Z0-9]{5,20}$');
  final formkey = GlobalKey<FormState>();

  // getdata() async {
  //   SharedPreferences username = await SharedPreferences.getInstance();
  //   username.setString('name',name.text);
  //   username.setString('pass', password.text);
  //   username.setBool('keep', true);
  // }
  loginUsingGetMethod() async {
    var data = await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: name.text.trim())
        .get();
    print(data.docs);

    if (data.docs.isNotEmpty) {
      print(data.docs[0]);
      if (data.docs[0]["password"] == password.text) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Home_page(),
            ),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Passwords do not match")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No account found",)));
    }

    setState(() {});
  }

  loginUsingAuth() {
    
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: name.text, password: password.text)
        .then((value) {
          userId=name.text;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home_page(),
          ));
    }).catchError((error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConst.white,
        title: Text(
          "CRUD",
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: w * 0.05,
              color: ColorConst.black),
        ),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(w * 0.05),
                child: Container(
                    height: w * 0.5,
                    width: w * 0.9,
                    child: Image.asset(imageconstant.Codephoto)),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(w * 0.05),
                    child: TextFormField(
                        controller: name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.newline,
                        // validator: (value) {
                        //   if (usernameRegex.hasMatch(value!)) {
                        //     return null;
                        //   } else {
                        //     return "pls enter valid Username";
                        //   }
                        // },
                        decoration: InputDecoration(
                          label: Text(
                            "user name",
                            style: TextStyle(
                                color: ColorConst.black, fontSize: w * 0.05),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.red.shade800, width: w * 0.005),
                              borderRadius: BorderRadius.circular(w * 0.03)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w * 0.03),
                              borderSide: BorderSide(
                                color: Colors.red.shade800,
                              )),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w * 0.05),
                    child: Container(
                      width: w * 0.9,
                      height: w * 0.15,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colorconst.primarycolor),
                        // borderRadius:
                        color: ColorConst.white,
                      ),
                      child: TextFormField(
                        controller: password,
                        keyboardType: TextInputType.text,
                        obscureText: a ? false : true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.newline,
                        // validator: (value) {
                        //   if (passwordvalidation.hasMatch(value!)) {
                        //     return null;
                        //   } else {
                        //     return "pls enter valid password";
                        //   }
                        // },
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () {
                                a = !a;
                                setState(() {});
                              },
                              child: Icon(
                                  a ? Icons.visibility : Icons.visibility_off)),
                          label: Text(
                            "password",
                            style: TextStyle(
                                color: ColorConst.black, fontSize: w * 0.05),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.05),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.red.shade800, width: w * 0.005),
                              borderRadius: BorderRadius.circular(w * 0.05)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w * 0.06),
                              borderSide: BorderSide(
                                color: Colors.red.shade800,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      loginUsingAuth();

                      // if (formkey.currentState!.validate() &&
                      //     name.text.isNotEmpty &&
                      //     password.text.isNotEmpty) {
                      //   Navigator.pushAndRemoveUntil(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => Home_page(),
                      //       ),
                      //       (route) => false);
                      // } else {
                      //   password.toString() == ""
                      //       ? ScaffoldMessenger.of(context).showSnackBar(
                      //           SnackBar(content: Text("please enter your Name")))
                      //       : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //           content: Text("enter your valid Details")));
                      //
                      //   name.text.isEmpty
                      //       ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //           content: Text("Please enter the Username")))
                      //       : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //           content: Text("Please enter the Password")));
                      // }
                    },
                    child: Container(
                      height: w * 0.13,
                      width: w * 0.7,
                      decoration: BoxDecoration(
                          color: ColorConst.white,
                          borderRadius: BorderRadius.circular(w * 0.06),
                          border: Border.all(color: ColorConst.Darkblue)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(imageconstant.Lock),
                          Text(
                            "Login",
                            style: TextStyle(
                                color: ColorConst.Darkblue,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: w * 0.04,
                  ),
                  InkWell(
                    onTap: () async {
                      googleSignInFunction();

                      // User? user = await _handleSignIn();
                      // if (user != null) {
                      //   print("Signed in: ${user.displayName}");
                      // }
                    },
                    child: Container(
                      height: w * 0.13,
                      width: w * 0.7,
                      decoration: BoxDecoration(
                          color: ColorConst.white,
                          borderRadius: BorderRadius.circular(w * 0.06),
                          border: Border.all(color: ColorConst.Darkblue)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(imageconstant.goglelogo),
                          Text(
                            " Sign in with Google",
                            style: TextStyle(
                                color: ColorConst.Darkblue,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ), /**/
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
                            builder: (context) => phone(),
                          ));
                    },
                    child: Container(
                      height: w * 0.13,
                      width: w * 0.7,
                      decoration: BoxDecoration(
                          color: ColorConst.white,
                          borderRadius: BorderRadius.circular(w * 0.06),
                          border: Border.all(color: ColorConst.Darkblue)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.phone),
                          Text(
                            " OTP sign in",
                            style: TextStyle(
                                color: ColorConst.Darkblue,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(w * 0.05),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Sing_up(),
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account ?",
                        style: TextStyle(
                            color: ColorConst.Darkblue,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Create Now",
                        style: TextStyle(
                            color: ColorConst.Darkblue,
                            fontWeight: FontWeight.w900,
                            fontSize: w * 0.04),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
