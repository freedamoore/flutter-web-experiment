import 'package:flutter/material.dart';
import 'package:flutter_web_experiment/skills/skills_view.dart';

class OutlineSkillsContainer extends StatelessWidget {
  const OutlineSkillsContainer({
    Key key,
    @required this.index,
    this.rowIndex,
    this.isMobile,
  }) : super(key: key);

  final int index;
  final int rowIndex;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final parsedIndex = isMobile ?? false ? index : (index * 2) + rowIndex;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            width: 3,
            color: (index % 2 == 0)
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        skills.elementAt(parsedIndex),
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
