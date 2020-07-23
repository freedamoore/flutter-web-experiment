import 'package:flutter/material.dart';
import 'package:flutter_web_experiment/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BlogView extends StatelessWidget {
  const BlogView({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(builder: (_, size) {
      if (size.screenSize.width < 650)
        return Container(
          padding:
              EdgeInsets.symmetric(horizontal: kMobilePadding, vertical: 40.0),
          width: width,
          color: Colors.white,
          child: BlogList(),
        );
      return Container(
        padding:
            EdgeInsets.symmetric(horizontal: kDesktopPadding, vertical: 40.0),
        width: width,
        color: Colors.white,
        child: BlogList(),
      );
    });
  }
}

class BlogList extends StatelessWidget {
  const BlogList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Blog',
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(height: 40),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 300.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var i = 0; i < 10; i++)
                Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        padding: EdgeInsets.all(20),
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          'Blog post ' + (i + 1).toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            textStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (i + 4).toString() + 'th August 2020',
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                textStyle: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'This is a cool scrollable list made with the ListView widget and setting the ScrollDirection to Axis.horizontal. Give it a go! ... ' *
                                  3,
                              maxLines: 8,
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
