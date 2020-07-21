import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  SizedBox(width: 20),
                  FlutterLogo(colors: Theme.of(context).primaryColor),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
                ],
              ));
        }

        final onPressed = () => print('click');

        return Container(
          height: 60,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          color: Theme.of(context).accentColor,
          child: Row(
            children: [
              FlutterLogo(colors: Theme.of(context).primaryColor),
              Spacer(),
              for (var item in kNavigationItems)
                NavigationBarItem(onPressed: onPressed, text: item.text),
            ],
          ),
        );
      },
    );
  }
}

class NavigationItem {
  final String text;
  NavigationItem(this.text);
}

final kNavigationItems = [
  NavigationItem('Projects'),
  NavigationItem('Skills'),
  NavigationItem('About Me'),
  NavigationItem('Blog'),
];

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
