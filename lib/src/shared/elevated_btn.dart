import '../global_export.dart';

class CLElevatedBtn extends StatelessWidget {
  const CLElevatedBtn({
    super.key,
    required this.btnTitle,
    required this.onPressed,
    this.height,
    this.bgColor,
    this.fgColor,
    this.showLoading
  });

  final String btnTitle;
  final void Function()? onPressed;
  final double? height;
  final Color? bgColor, fgColor;
  final bool? showLoading;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: showLoading ?? false,
      child: ElevatedButton(
        onPressed:  onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: fgColor,
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          fixedSize: Size(context.screenWidth, height ?? 45)
        ),
        child: (showLoading ?? false) ? const CLLoadingIndicator() :  Text(btnTitle),
      ),
    );
  }
}

