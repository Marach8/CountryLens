// import 'package:shimmer/shimmer.dart';
// import '../global_export.dart';

// class CLShimmer extends StatelessWidget {
//   const CLShimmer({
//     super.key,
//     this.height,
//     this.width,
//     this.radius,
//     this.baseColor,
//     this.highlightColor,
//     this.margin,
//   });

//   final double? height, width, radius;
//   final EdgeInsetsGeometry? margin;
//   final Color? highlightColor, baseColor;

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: baseColor ?? CLColors.white.withValues(alpha: 0.7),
//       highlightColor: highlightColor ?? CLColors.hex9A9A9A,
//       child: CLContainer(
//         margin: margin,
//         height: height ?? 150, radius: radius ?? 10,
//         color: baseColor ?? CLColors.hexBCBCBC,
//         width: width ?? context.getScreenWidth,
//       ),
//     );
//   }
// }
