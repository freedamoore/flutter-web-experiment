import 'package:flutter/material.dart';
import 'package:flutter_web_experiment/skills/outline_skills_container.dart';
import 'package:flutter_web_experiment/utils/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

final skills = [
  'HTML',
  'CSS',
  'JavaScript',
  'React',
  'SQL',
  'Flutter',
  'Dart',
  'Python'
];

class SkillsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, size) {
      if (size.screenSize.width < 650) return SkillsMobileView();
      return SkillsDesktopView();
    });
  }
}

class SkillsDesktopView extends StatelessWidget {
  const SkillsDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        padding:
            EdgeInsets.symmetric(horizontal: kDesktopPadding, vertical: 40.0),
        width: width,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skills',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 40),
            for (var j = 0; j < skills.length / 4; j++) ...[
              Row(
                children: [
                  for (var i = 0; i < skills.length / 2; i++)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: i != 0 ? 8.0 : 0),
                        child: OutlineSkillsContainer(index: i, rowIndex: j),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20),
            ]
          ],
        ));
  }
}

class SkillsMobileView extends StatelessWidget {
  const SkillsMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kMobilePadding, vertical: 40.0),
      width: width,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 40),
          for (var index = 0; index < skills.length; index++) ...[
            OutlineSkillsContainer(
              index: index,
              isMobile: true,
            ),
            SizedBox(height: 10)
          ]
        ],
      ),
    );
  }
}
