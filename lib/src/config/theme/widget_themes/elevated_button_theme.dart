
import '../../../global_export.dart';

class CLElevatedButtonTheme{
  const CLElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CLColors.white,
      backgroundColor: CLColors.hex1B1B1B,
      disabledForegroundColor: CLColors.white.withValues(alpha: 0.3),
      disabledBackgroundColor: CLColors.transparent,
      textStyle: TextStyle(
        fontFamily: CLStrings.AXIFORMA,
        fontSize: CLFontSizes.size18,
        fontWeight: CLFontWeights.w600
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
    )
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CLColors.hex1B1B1B,
      backgroundColor: CLColors.white,
      disabledForegroundColor: CLColors.hex1B1B1B.withValues(alpha: 0.3),
      disabledBackgroundColor: CLColors.transparent,
      textStyle: TextStyle(
        fontFamily: CLStrings.AXIFORMA,
        fontSize: CLFontSizes.size18,
        fontWeight: CLFontWeights.w600
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
    )
  );
}