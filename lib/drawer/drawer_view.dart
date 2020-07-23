import 'package:flutter/material.dart';
import 'package:flutter_web_experiment/main.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
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
              for (var item in navigationItems)
                ListTile(
                  title: Text(item.text),
                  onTap: () {
                    scrollController.animateTo(
                      item.position,
                      duration: Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                    );
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
