import 'package:flutter/material.dart';
import 'package:flutter_web_experiment/utils/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final List<String> technologies;

  ProjectItem({
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.technologies,
  });
}

final kProjectItems = [
  ProjectItem(
    image: 'images/mock1.png',
    title: 'Mock Project 1',
    description:
        'A Pretend project with a nice image just to make the project look nice.',
    technologies: ['Flutter', 'Dart'],
  ),
  ProjectItem(
    image: 'images/mock2.png',
    title: 'Mock Project 2',
    description:
        'A Pretend project with a nice image just to make the project look nice.',
    technologies: ['HTML', 'CSS', 'JS'],
  ),
  ProjectItem(
    image: 'images/mock3.png',
    title: 'Mock Project 3',
    description:
        'A Pretend project with a nice image just to make the project look nice.',
    technologies: ['React'],
  ),
];

class ProjectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, size) {
      if (size.isMobile) return ProjectMobileView();
      return ProjectDesktopView();
    });
  }
}

class ProjectDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      padding:
          EdgeInsets.symmetric(horizontal: kDesktopPadding, vertical: 40.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final item in kProjectItems)
                Expanded(child: ProjectItemBody(item: item))
            ],
          )
        ],
      ),
    );
  }
}

class ProjectItemBody extends StatelessWidget {
  const ProjectItemBody({
    Key key,
    @required this.item,
  }) : super(key: key);

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(item.image),
          SizedBox(height: 15),
          Text(
            item.title,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 10),
          Text(item.description, style: Theme.of(context).textTheme.bodyText1),
          SizedBox(height: 10),
          Row(
            children: [
              for (final tech in item.technologies)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Chip(
                    label: Text(
                      tech,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}

class ProjectMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: kMobilePadding, vertical: 40.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 40),
          for (final item in kProjectItems) ProjectItemBody(item: item)
        ],
      ),
    );
  }
}
