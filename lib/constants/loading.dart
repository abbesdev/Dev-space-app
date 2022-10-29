import 'package:flutter/material.dart';

import 'colors.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          color: mainColor,
        ),
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }
}
