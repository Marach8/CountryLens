import '../../../global_export.dart';

class CLInputDecorationTheme{
  const CLInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    isDense: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    fillColor: CLColors.transparent,
    filled: true,
    hintStyle: TextStyle(
      color: CLColors.black.withValues(alpha: 0.5),
      fontSize: CLFontSizes.size14,
      fontWeight: CLFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
    errorStyle: TextStyle(
      color: CLColors.red.withValues(alpha: 0.6),
      fontSize: CLFontSizes.size12,
      fontWeight: CLFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CLColors.hex1B1B1B
      )
    ),

    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CLColors.hex1B1B1B.withValues(alpha: 0.2)
      )
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CLColors.red.withValues(alpha: 0.6)
      )
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.8,
        color: CLColors.red.withValues(alpha: 0.8)
      )
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.8,
        color: CLColors.hex1B1B1B
      )
    ),
  );



  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    isDense: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    fillColor: CLColors.transparent,
    filled: true,
    hintStyle: TextStyle(
      color: CLColors.white.withValues(alpha: 0.5),
      fontSize: CLFontSizes.size14,
      fontWeight: CLFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CLColors.white.withValues(alpha: 0.5)
      )
    ),

    errorStyle: TextStyle(
      color: CLColors.red.withValues(alpha: 0.6),
      fontSize: CLFontSizes.size12,
      fontWeight: CLFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),


    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CLColors.white.withValues(alpha: 0.2)
      )
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CLColors.red.withValues(alpha: 0.6)
      )
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.8,
        color: CLColors.red.withValues(alpha: 0.8)
      )
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.8,
        color: CLColors.white
      )
    ),
  );
}