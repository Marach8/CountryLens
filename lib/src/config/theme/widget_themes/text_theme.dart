import '../../../global_export.dart';

class CLTextTheme{
  const CLTextTheme._();

  static TextTheme lightTextTheme = TextTheme( 
    headlineMedium: TextStyle(
      color: CLColors.hex1B1B1B,
      fontSize: CLFontSizes.size20,
      fontWeight: CLFontWeights.w700,
      overflow: TextOverflow.ellipsis,
    ),


    titleSmall: TextStyle(
      color: CLColors.hex1B1B1B,
      fontSize: CLFontSizes.size16,
      fontWeight: CLFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    
    bodySmall: TextStyle(
      color: CLColors.hex1B1B1B,
      fontSize: CLFontSizes.size14,
      fontWeight: CLFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
    
    labelMedium: TextStyle(
      color: CLColors.hex1B1B1B,
      fontSize: CLFontSizes.size12,
      fontWeight: CLFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),
  );



  static TextTheme darkTextTheme = TextTheme( 

    headlineMedium: TextStyle(
      color: CLColors.white,
      fontSize: CLFontSizes.size20,
      fontWeight: CLFontWeights.w700,
      overflow: TextOverflow.ellipsis,
    ),

    titleSmall: TextStyle(
      color: CLColors.white,
      fontSize: CLFontSizes.size16,
      fontWeight: CLFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    bodySmall: TextStyle(
      color: CLColors.white,
      fontSize: CLFontSizes.size14,
      fontWeight: CLFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    labelMedium: TextStyle(
      color: CLColors.white,
      fontSize: CLFontSizes.size10,
      fontWeight: CLFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),
  );
}