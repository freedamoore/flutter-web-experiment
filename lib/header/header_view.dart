import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_experiment/utils/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_experiment/main.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ResponsiveBuilder(
      builder: (_, size) {
        if (size.isMobile) return HeaderMobileView();
        return Container(
          height: height,
          width: width,
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDesktopPadding),
            child: Row(
              children: [
                Expanded(
                  child: HeaderBody(),
                ),
                FlutterLogo(
                  size: width * 0.4,
                  colors: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class HeaderBody extends StatelessWidget {
  final isMobile;
  const HeaderBody({
    Key key,
    this.isMobile = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Flutter for the Web',
          style: Theme.of(context).textTheme.headline1,
          maxLines: 2,
        ),
        AutoSizeText(
          'an experiment',
          style: Theme.of(context).textTheme.headline3,
          maxLines: 1,
        ),
        SizedBox(height: isMobile ?? false ? 20 : 40),
        AutoSizeText(
          'My first attempt at building a responsive website using Flutter and Dart.',
          style: TextStyle(fontSize: 24, color: Colors.white),
          maxLines: 3,
        ),
        SizedBox(height: isMobile ?? false ? 20 : 40),
        FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              scrollController.animateTo(
                navigationItems[0].position,
                duration: Duration(milliseconds: 700),
                curve: Curves.easeInOut,
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ?? false ? 10 : 17,
                horizontal: isMobile ?? false ? 8 : 15,
              ),
              child: Text(
                'Continue...',
                style: TextStyle(
                  fontSize: isMobile ?? false ? 20 : 24,
                  color: Colors.white,
                ),
              ),
            )),
      ],
    );
  }
}

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.9,
      width: width,
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: kMobilePadding, vertical: 40),
      child: Column(
        children: [
          Expanded(
            child: FlutterLogo(
              size: height * 0.3,
              colors: Theme.of(context).primaryColor,
            ),
          ),
          HeaderBody(isMobile: true),
        ],
      ),
    );
  }
}
