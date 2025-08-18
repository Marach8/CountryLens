import 'package:countrylens/src/config/config_export.dart';
import 'package:flutter/material.dart';

class CLRefreshIndicator extends StatelessWidget {
  const CLRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: context.textTheme.labelMedium?.color,
      color: Theme.of(context).scaffoldBackgroundColor,
      strokeWidth: 1.5,
      onRefresh: onRefresh,
      child: child,
    );
  }
}