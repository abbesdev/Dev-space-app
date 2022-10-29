import 'package:devapp/constants/colors.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Column(children: [
            SizedBox(
              height: height / 20,
            ),
            Row(
              children: [
                Container(
                    width: width / 1.8,
                    child: Text(
                      "Welcome to our DevSpace",
                      style: TextStyle(
                          color: myBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ))
              ],
            ),
            SizedBox(
              height: height / 60,
            ),
            Row(
              children: [
                Container(
                    width: width - 32,
                    child: Text(
                      "Here we have a safe space where developers can chat together",
                      style: TextStyle(
                          color: myGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ))
              ],
            ),
            SizedBox(
              height: height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("assets/Group 33664.png")],
            ),
            SizedBox(
              height: height / 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose to get in",
                  style: TextStyle(
                      color: myBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: height / 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: width / 1.4,
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: mainColor),
                    child: Center(
                        child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: width / 1.4,
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: secondaryColor),
                    child: Center(
                        child: Text(
                      "Login",
                      style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width - 34,
                  child: Text(
                    "You can join our community by signing up or by connecting to your existing account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: myBlack,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height / 70,
            )
          ]),
        ),
      ),
    );
  }
}
