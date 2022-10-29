import 'package:devapp/constants/colors.dart';
import 'package:devapp/ui/chat.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../constants/loading.dart';
import '../utils/AuthProvider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}
/*
final FirebaseAuth _auth = FirebaseAuth.instance;
get user => _auth.currentUser;
//SIGN IN METHOD
Future signIn({required String email, required String password}) async {
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    print("auth success");
  } on FirebaseAuthException catch (e) {
    print("false");
  }
}*/

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: "Sign in fail");
        break;
      case Status.authenticateCanceled:
        Fluttertoast.showToast(msg: "Sign in canceled");
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: "Sign in success");
        break;
      default:
        break;
    }
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff1E1F1F),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Column(children: [
              SizedBox(
                height: height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: width / 1.1,
                      child: Text(
                        "Welcome to our DevSpace",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ))
                ],
              ),
              SizedBox(
                height: height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width / 1.2,
                    child: Lottie.network(
                      'https://assets5.lottiefiles.com/packages/lf20_p5yomfw6.json',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 20,
              ),
              Row(
                children: [
                  Container(
                      width: width / 1.2,
                      child: Text(
                        "Please Sign in with your Google Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: -0.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: width / 1.3,
                      child: Text(
                        "You can join our community by signing up or by connecting to your existing account.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            letterSpacing: -0.5,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ))
                ],
              ),
              SizedBox(
                height: height / 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      bool isSuccess = await authProvider.handleSignIn();
                      if (isSuccess) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(),
                          ),
                        );
                      }
                    },
                    //     signIn(email: _email.text, password: _password.text),
                    child: Container(
                      width: width / 1.29,
                      height: 70,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: myGrey.withOpacity(0.3),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff1E1F1F)),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/google.png",
                                width: 27,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Sign in with Google",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              )
                            ],
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
