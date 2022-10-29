import 'package:devapp/constants/colors.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: height / 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "What you will enjoy",
                style: TextStyle(
                    color: myBlack, fontWeight: FontWeight.bold, fontSize: 22),
              )
            ],
          ),
          SizedBox(
            height: height / 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width - 100,
                child: Text(
                  "Here we have a safe space where developers can chat together",
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
            height: height / 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("assets/Group 33665.png")],
          ),
          SizedBox(
            height: height / 6,
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
                  child: const Center(
                      child: Text(
                    "Get in",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  )),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
