import 'package:devapp/ui/calls.dart';
import 'package:devapp/ui/chat.dart';
import 'package:devapp/ui/settings.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class VideoCallsScreen extends StatefulWidget {
  const VideoCallsScreen({Key? key}) : super(key: key);

  @override
  _VideoCallsScreenState createState() => _VideoCallsScreenState();
}

class _VideoCallsScreenState extends State<VideoCallsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            color: myGrey.withOpacity(0.13),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Image.asset("assets/Search.png")),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Video Calls",
                        style: TextStyle(
                            color: myBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/66.png",
                        width: 50,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  width: width - 40,
                  child: DefaultTabController(
                      length: 2,
                      child: TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(
                            child: Text("All Calls",
                                style: TextStyle(
                                  color: myBlack,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                )),
                          ),
                          Tab(
                            child: Text("Missed Calls",
                                style: TextStyle(
                                  color: myBlack,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                )),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: width - 40,
                    height: height / 1.57,
                    child: TabBarView(controller: _tabController, children: <
                        Widget>[
                      Container(
                        width: width - 60,
                        height: height - 350,
                        child: ListView(
                          children: [
                            GestureDetector(
                              child: Container(
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                "assets/66.png",
                                                width: 55,
                                              )
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: const [
                                                  Text(
                                                    "Karim benmbarek",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: height / 150,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Call Ended at 19:30",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: mainColor),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                    width: width / 3,
                                                    height: 48,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Color(0xFFC4C4C4)
                                                            .withOpacity(0.13)),
                                                    child: Center(
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Image.asset(
                                                                    "assets/video.png"),
                                                                Text("Recall")
                                                              ],
                                                            )
                                                          ]),
                                                    )),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: width - 60,
                        height: height - 350,
                        child: ListView(
                          children: [
                            GestureDetector(
                              child: Container(
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                "assets/66.png",
                                                width: 55,
                                              )
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: const [
                                                  Text(
                                                    "Karim benmbarek",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: height / 150,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Missed Call at 19:02",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: myRed),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                    width: width / 3,
                                                    height: 48,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Color(0xFFC4C4C4)
                                                            .withOpacity(0.13)),
                                                    child: Center(
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Image.asset(
                                                                    "assets/video.png"),
                                                                Text("Recall")
                                                              ],
                                                            )
                                                          ]),
                                                    )),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      )
                    ]))
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  width: width - 40,
                  height: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFE0F4FF).withOpacity(0.46)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: (() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatScreen()))),
                              child: Image.asset(
                                "assets/Message.png",
                                width: 24,
                              ),
                            ),
                            GestureDetector(
                              onTap: (() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CallsScreen()))),
                              child: Image.asset(
                                "assets/Phone.png",
                                width: 26,
                              ),
                            ),
                            GestureDetector(
                              child: Image.asset("assets/Group 33628.png"),
                            ),
                            GestureDetector(
                              onTap: (() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VideoCallsScreen()))),
                              child: Image.asset(
                                "assets/video_2.png",
                                width: 26,
                              ),
                            ),
                            GestureDetector(
                              onTap: (() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Settingss()))),
                              child: Image.asset("assets/user_2.png"),
                            )
                          ],
                        )
                      ]),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
