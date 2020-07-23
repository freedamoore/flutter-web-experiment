import 'package:flutter/material.dart';
import 'package:flutter_web_experiment/main.dart';
import 'package:flutter_web_experiment/utils/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:provider/provider.dart';

class NavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    final width = MediaQuery.of(context).size.width;

    return ResponsiveBuilder(
      builder: (context, size) {
        if (size.isMobile) {
          return Container(
              height: 60,
              width: double.infinity,
              color: Theme.of(context).accentColor,
              child: Row(
                children: [
                  SizedBox(width: kMobilePadding),
                  FlutterLogo(colors: Theme.of(context).primaryColor),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
                ],
              ));
        }

        return Container(
          height: 60,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: kDesktopPadding),
          color: Theme.of(context).accentColor,
          child: Row(
            children: [
              FlutterLogo(colors: Theme.of(context).primaryColor),
              Spacer(),
              for (var item in navigationItems)
                NavigationBarItem(
                  onPressed: () {
                    scrollController.animateTo(
                      item.position,
                      duration: Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                    );
                  },
                  text: item.text,
                ),
            ],
          ),
        );
      },
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 650;
    return Container(
      padding: EdgeInsets.only(left: 32),
      child: InkWell(
        onTap: onPressed,
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          text,
          style: TextStyle(fontSize: isSmall ? 16 : 18, color: Colors.white),
        ),
      ),
    );
  }
}
