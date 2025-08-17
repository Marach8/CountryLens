import 'package:flutter/material.dart';

class CLSliverHeader extends SliverPersistentHeaderDelegate {

  CLSliverHeader({
    required this.child,
    required this.maxExt,
    required this.minExt,
    this.rebuild = false
  });
  final Widget child;
  final bool rebuild;
  final double minExt, maxExt;

  @override
  double get minExtent => minExt;

  @override
  double get maxExtent => maxExt;

  @override
  Widget build(_, __, ___) => child;

  @override
  bool shouldRebuild(_) => rebuild;
}
