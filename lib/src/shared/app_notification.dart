import '../global_export.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> showNotification({
  required String text,
  required bool isSuccessful,
  int? duration
}) async{
  final BuildContext? context = scaffoldMessengerKey.currentState?.context;
  if (context == null) return;

  scaffoldMessengerKey.currentState?.showMaterialBanner(
    MaterialBanner(
      backgroundColor: CLColors.transparent,
      elevation: 0,
      onVisible: () async => await Future<void>.delayed(
        Duration(seconds: duration ?? 3),
        () => scaffoldMessengerKey.currentState?.hideCurrentMaterialBanner(),
      ),
      dividerColor: CLColors.transparent,
      content: Center(
        child: CustomPaint(
          painter: _LeftBorderPainter(
            color: isSuccessful ? CLColors.green : CLColors.red,
          ),
          child: CLContainer(
            margin: const EdgeInsets.only(left: 5),
            radius: 8, color: CLColors.hex303439,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if(isSuccessful) Icon(Icons.check_circle, color: CLColors.green)
                else Icon(Icons.warning_rounded, color: CLColors.red,),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    text, maxLines: 3,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: CLColors.white
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                InkWell(
                  onTap: () => scaffoldMessengerKey.currentState?.hideCurrentMaterialBanner(),
                  child: Icon(Icons.close, color: CLColors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: const <Widget>[SizedBox.shrink()]
    )
  );
}



class _LeftBorderPainter extends CustomPainter {
  
  _LeftBorderPainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();
    const double curveWidth = 15;
    const double startPoint = 13;

    path.moveTo(startPoint, 0);
    path.quadraticBezierTo(0, 0, 0, curveWidth);
    path.lineTo(0, size.height - curveWidth);
    path.quadraticBezierTo(0, size.height, startPoint, size.height);
    path.lineTo(curveWidth, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}
