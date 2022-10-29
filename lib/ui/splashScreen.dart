import 'package:devapp/constants/colors.dart';
import 'package:devapp/ui/chat.dart';
import 'package:devapp/ui/login.dart';
import 'package:devapp/utils/AuthProvider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      // just delay for showing this slash page clearer because it too fast
      checkSignedIn();
    });
  }

  void checkSignedIn() async {
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isLoggedIn = await authProvider.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen()),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1F1F),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/applogo.png",
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: mainColor),
            ),
          ],
        ),
      ),
    );
  }
}
