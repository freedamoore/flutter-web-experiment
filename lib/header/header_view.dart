import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Row(
              children: [
                Expanded(
                  child: HeaderBody(),
                ),
                FlutterLogo(
                  size: width * 0.4,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Flutter Web Experiment',
          style: GoogleFonts.montserrat(
            fontSize: 60,
            textStyle: TextStyle(color: Colors.white),
          ),
          maxLines: 2,
        ),
        AutoSizeText(
          'by Freeda Moore',
          style: GoogleFonts.montserrat(
            fontSize: 60,
            textStyle: TextStyle(color: Colors.redAccent[100]),
          ),
          maxLines: 1,
        ),
        SizedBox(height: isMobile ?? false ? 20 : 40),
        AutoSizeText(
          'My first attempt at building a responsive web app using Flutter and Dart.',
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
            color: Colors.redAccent[100],
            onPressed: () {},
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          FlutterLogo(size: height * 0.3),
          Spacer(),
          HeaderBody(isMobile: true),
        ],
      ),
    );
  }
}
