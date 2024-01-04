import 'package:flutter/material.dart';
import 'package:user_list/widgets/theme.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.title,
    this.actions,
    this.centerTitle = true,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: activeGreenColor,
        title: Text(
          title,
          style: titleStyle,
        ),
        centerTitle: centerTitle,
        actions: actions,
      );
}
