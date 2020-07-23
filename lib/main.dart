import 'package:flutter/material.dart';
import 'package:flutter_web_experiment/blog/blog_view.dart';
import 'package:flutter_web_experiment/drawer/drawer_view.dart';
import 'package:flutter_web_experiment/header/header_view.dart';
import 'package:flutter_web_experiment/navigation_bar/navigation_bar_view.dart';
import 'package:flutter_web_experiment/project/project_view.dart';
import 'package:flutter_web_experiment/skills/skills_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web Experiment',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: Colors.cyan,
          accentColor: Colors.pink[900],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline1: GoogleFonts.montserrat(
              fontSize: 50,
              textStyle: TextStyle(color: Colors.white),
            ),
            headline2: GoogleFonts.montserrat(
              fontSize: 50,
              textStyle: TextStyle(color: Colors.black),
            ),
            headline3: GoogleFonts.montserrat(
              fontSize: 50,
              textStyle: TextStyle(color: Colors.pink[900]),
            ),
            headline4: GoogleFonts.montserrat(
              fontSize: 30,
              textStyle: TextStyle(color: Colors.cyan),
            ),
            bodyText1: GoogleFonts.montserrat(
              textStyle: TextStyle(color: Colors.black),
            ),
            bodyText2: GoogleFonts.montserrat(
              textStyle: TextStyle(color: Colors.white),
            ),
          )),
      home: WebView(),
    );
  }
}

class WebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final ScrollController scrollController =
    //     ScrollController(initialScrollOffset: 2000);
    return Scaffold(
      endDrawer: DrawerView(),
      body: SingleChildScrollView(
        // controller: scrollController,
        child: Column(
          children: [
            NavigationBarView(),
            HeaderView(),
            ProjectView(),
            SkillsView(),
            BlogView(),
          ],
        ),
      ),
    );
  }
}
