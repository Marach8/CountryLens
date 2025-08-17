import '../global_export.dart';

class CLLoadingIndicator extends StatelessWidget {
  const CLLoadingIndicator({
    super.key,
    this.color,
    this.size = 25
  });
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size, width: size,
      child: CircularProgressIndicator(
        color: color ?? Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: (color ?? Theme.of(context)
          .scaffoldBackgroundColor).withValues(alpha: 0.5),
        strokeWidth: 3,
      ),
    );
  }
}
