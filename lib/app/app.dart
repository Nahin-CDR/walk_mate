import 'package:flutter/material.dart';
import 'package:tracker/presentation/resources/routes_manager.dart';
import 'package:provider/provider.dart';
import 'package:tracker/presentation/resources/theme_manager.dart';
import '../presentation/home/home_view_model.dart';
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeManager themeManager = ThemeManager();
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
        builder : (context,themeProvider,child){
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_)=> HomeViewModel() )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: themeProvider.themeMode,
              onGenerateRoute: RoutesGenerator.getRoute,
              initialRoute: Routes.splashRoute,
            ),
          );
        }
    );
  }
}
