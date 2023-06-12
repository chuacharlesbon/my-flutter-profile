import 'package:flutter/material.dart';
import 'package:myflutterprofile/core/enums/state_status_enums.dart';

class AppTitleBuilder extends StatelessWidget {
  const AppTitleBuilder({
    Key? key,
    this.title,
    required this.child,
  }) : super(key: key);

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    StateStatus tempStatus = StateStatus.loaded;
    switch (tempStatus) {
      case StateStatus.loaded:
        return Title(
          color: Colors.black,
          title: title ?? 'My Profile | Home',
          child: child,
        );

      default:
        return child;
    }
  }
}
