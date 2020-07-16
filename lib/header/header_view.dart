import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Flutter Web Experiment',
                      style: GoogleFonts.montserrat(
                        fontSize: 60,
                        textStyle: TextStyle(color: Colors.white),
                      )),
                  Text('by Freeda Moore',
                      style: GoogleFonts.montserrat(
                        fontSize: 60,
                        textStyle: TextStyle(color: Colors.redAccent[100]),
                      )),
                  SizedBox(height: 40),
                  Text(
                    'My first attempt at building a Web app using Flutter and Dart.',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  SizedBox(height: 40),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      color: Colors.redAccent[100],
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 17,
                          horizontal: 15,
                        ),
                        child: Text(
                          'Continue...',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            FlutterLogo(
              size: 300,
            )
          ],
        ),
      ),
    );
  }
}
