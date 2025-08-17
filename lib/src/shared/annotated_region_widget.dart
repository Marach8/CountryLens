import 'package:countrylens/src/config/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CLAnnotatedRegion extends StatelessWidget {
  const CLAnnotatedRegion({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bool inDarkMode = context.isInDarkMode;
    
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness: inDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness: inDarkMode ? Brightness.light : Brightness.dark,
      ),
      child: child
    );
  }
}