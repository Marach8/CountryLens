import '../../global_export.dart';

class CLThemeData{
  const CLThemeData._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: CLStrings.AXIFORMA,
    brightness: Brightness.light,
    scaffoldBackgroundColor: CLColors.white,
    textTheme: CLTextTheme.lightTextTheme,
    inputDecorationTheme: CLInputDecorationTheme.lightInputDecorationTheme,
    appBarTheme: CLAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: CLElevatedButtonTheme.lightElevatedButtonTheme
  );


  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: CLStrings.AXIFORMA,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CLColors.black,
    textTheme: CLTextTheme.darkTextTheme,
    inputDecorationTheme: CLInputDecorationTheme.darkInputDecorationTheme,
    appBarTheme: CLAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: CLElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
