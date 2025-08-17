import 'src/global_export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GraphQLService().init(endpoint: "https://countries.trevorblades.com/");
  runApp(const CLApp());
}

class CLApp extends StatelessWidget {
  const CLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(1),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: CLThemeData.darkTheme,
        theme: CLThemeData.lightTheme,
        home: const CLHomeScreen(),
      ),
    );
  }
}