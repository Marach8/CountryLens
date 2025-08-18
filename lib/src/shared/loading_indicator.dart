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
        color: color ?? context.textTheme.headlineMedium?.color,
        backgroundColor: (color ?? context.textTheme.headlineMedium?.color)
          ?.withValues(alpha: 0.5),
        strokeWidth: 3,
      ),
    );
  }
}
