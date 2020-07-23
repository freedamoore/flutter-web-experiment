import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_experiment/blog/blog_view.dart';
import 'package:flutter_web_experiment/drawer/drawer_view.dart';
import 'package:flutter_web_experiment/footer/footer_view.dart';
import 'package:flutter_web_experiment/header/header_view.dart';
import 'package:flutter_web_experiment/navigation_bar/navigation_bar_view.dart';
import 'package:flutter_web_experiment/project/project_view.dart';
import 'package:flutter_web_experiment/skills/skills_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

class WebView extends StatefulWidget {
  const WebView({
    Key key,
  }) : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> with AfterLayoutMixin {
  final projectKey = GlobalKey();
  final skillsKey = GlobalKey();
  final blogKey = GlobalKey();
  List<NavigationItem> navigationItems = [];
  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 0);

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      navigationItems = [
        NavigationItem('Projects', key: projectKey),
        NavigationItem('Skills', key: skillsKey),
        NavigationItem('Blog', key: blogKey),
      ];
    });

    // final projectPosition = _getPosition(projectKey);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ProxyProvider0<List<NavigationItem>>(
            update: (_, __) => navigationItems),
        ChangeNotifierProvider<ScrollController>(
            create: (_) => scrollController),
      ],
      child: Scaffold(
        endDrawer: DrawerView(),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              NavigationBarView(),
              HeaderView(),
              ProjectView(key: projectKey),
              SkillsView(key: skillsKey),
              BlogView(key: blogKey),
              FooterView(),
            ],
          ),
        ),
        floatingActionButton: BackToTopBtn(),
      ),
    );
  }
}

class BackToTopBtn extends StatelessWidget {
  const BackToTopBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = context.watch<ScrollController>();
    if (scrollController.isOffsetZero) return SizedBox();
    return FloatingActionButton(
      child: Icon(Icons.arrow_upward),
      onPressed: () {
        scrollController.animateTo(0,
            duration: Duration(milliseconds: 700), curve: Curves.easeInOut);
      },
    );
  }
}

extension on ScrollController {
  bool get isOffsetZero {
    return this.offset == 0;
  }
}

class NavigationItem {
  final String text;
  final GlobalKey key;
  NavigationItem(this.text, {@required this.key});

  double get position => _getPosition(key);
}

double _getPosition(GlobalKey key) {
  final RenderBox renderBox = key.currentContext.findRenderObject();
  final position = renderBox.localToGlobal(Offset.zero);
  final scrollOffset = position.dy;
  return scrollOffset;
}
