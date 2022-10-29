import 'package:devapp/constants/colors.dart';
import 'package:flutter/material.dart';

class FriendProfileScreen extends StatefulWidget {
  const FriendProfileScreen({Key? key}) : super(key: key);

  @override
  _FriendProfileScreenState createState() => _FriendProfileScreenState();
}

class _FriendProfileScreenState extends State<FriendProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          color: myGrey.withOpacity(0.13),
                          borderRadius: BorderRadius.circular(10)),
                      child:
                          Center(child: Image.asset("assets/chevron-left.png")),
                    )
                  ],
                ),
                const SizedBox(
                  width: 75,
                ),
                Column(
                  children: [
                    Text(
                      "Mohamed Ab.",
                      style: TextStyle(
                          color: myBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("assets/66.png")],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 40,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 57,
                        height: 57,
                        decoration: BoxDecoration(
                            color: myGrey.withOpacity(0.13),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Image.asset("assets/Phone.png")),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Call",
                        style: TextStyle(
                            color: myBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 57,
                        height: 57,
                        decoration: BoxDecoration(
                            color: myGrey.withOpacity(0.13),
                            borderRadius: BorderRadius.circular(10)),
                        child:
                            Center(child: Image.asset("assets/Message 1.png")),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Message",
                        style: TextStyle(
                            color: myBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 57,
                        height: 57,
                        decoration: BoxDecoration(
                            color: myGrey.withOpacity(0.13),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Image.asset("assets/More-vertical.png")),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "More",
                        style: TextStyle(
                            color: myBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 40,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Row(
              children: [
                Text(
                  "Full name",
                  style:
                      TextStyle(fontSize: 18, color: myBlack.withOpacity(0.47)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: Row(
              children: [
                Text(
                  "Mohamed Abbes",
                  style: TextStyle(
                      color: myBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Row(
              children: [
                Text(
                  "Email address",
                  style:
                      TextStyle(fontSize: 18, color: myBlack.withOpacity(0.47)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: Row(
              children: [
                Text(
                  "abbesmohamed45@gmail.com",
                  style: TextStyle(
                      color: myBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Row(
              children: [
                Text(
                  "Bio",
                  style:
                      TextStyle(fontSize: 18, color: myBlack.withOpacity(0.47)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: Row(
              children: [
                Container(
                    width: 400,
                    child: Text(
                      "I’m a software Engineer that enjoys Creating, Designing and Developing Softwares to help the world stand out.",
                      style: TextStyle(
                          color: myBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Row(
              children: [
                Text(
                  "Shared medias",
                  style:
                      TextStyle(fontSize: 18, color: myBlack.withOpacity(0.47)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    width: 120,
                    height: 120,
                    color: myGrey,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: 120,
                    height: 120,
                    color: myGrey,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: 120,
                    height: 120,
                    color: myGrey,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    width: 120,
                    height: 120,
                    color: myGrey,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: 120,
                    height: 120,
                    color: myGrey,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: 120,
                    height: 120,
                    color: myGrey,
                  ),
                )
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
