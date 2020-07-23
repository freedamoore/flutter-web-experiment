import 'package:flutter/material.dart';

class FooterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final currentYear = DateTime.now().year;
    return Container(
      height: 100,
      width: width,
      color: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('© Freeda Moore $currentYear'),
        ],
      ),
    );
  }
}
