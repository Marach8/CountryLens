import 'dart:ui' show ImageFilter;
import '../global_export.dart';

class RetryBtn extends StatelessWidget {
  const RetryBtn({
    super.key,
    required this.onRetry
  });

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: CLContainer(
          onTap: onRetry,
          border: Border.all(color: CLColors.hex307FE2, width: 0.5),
          height: 70, width: 80, radius: 10,
          child: Icon(
            Icons.rotate_right_outlined, size: 50,
            color: context.textTheme.headlineMedium?.color
          )
        ),
      ),
    );
  }
}