import 'package:flutter/material.dart';
import 'package:flutter_web_experiment/header/header_view.dart';
import 'package:flutter_web_experiment/navigation_bar/navigation_bar_view.dart';
import 'package:flutter_web_experiment/project/project_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
              fontSize: 60,
              textStyle: TextStyle(color: Colors.white),
            ),
            headline2: GoogleFonts.montserrat(
              fontSize: 60,
              textStyle: TextStyle(color: Colors.black),
            ),
            headline3: GoogleFonts.montserrat(
              fontSize: 60,
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
    return Scaffold(
      endDrawer: DrawerView(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavigationBarView(),
            HeaderView(),
            ProjectView(),
          ],
        ),
      ),
    );
  }
}

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, size) {
        if (!size.isMobile) return SizedBox();
        return Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                ),
              ),
              for (var item in kNavigationItems)
                ListTile(
                  title: Text(item.text),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
