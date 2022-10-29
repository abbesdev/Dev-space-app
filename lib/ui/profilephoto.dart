import 'package:devapp/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfilePhotoScreen extends StatefulWidget {
  const ProfilePhotoScreen({Key? key}) : super(key: key);

  @override
  _ProfilePhotoScreenState createState() => _ProfilePhotoScreenState();
}

class _ProfilePhotoScreenState extends State<ProfilePhotoScreen> {
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
                "Add your Profile Picture",
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
                  "Select a profile photo from gallery or your camera",
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
            height: height / 5.6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("assets/Group 33666.png")],
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
                    "Upload photo",
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
