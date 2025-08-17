import '../../../global_export.dart';

class CLAppBarTheme{
  const CLAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: CLColors.white,
    titleTextStyle: TextStyle(
      color: CLColors.hex1B1B1B,
      fontSize: CLFontSizes.size16,
      fontWeight: CLFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
  );


  static AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: CLColors.black,
    titleTextStyle: TextStyle(
      color: CLColors.white,
      fontSize: CLFontSizes.size16,
      fontWeight: CLFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
