import 'package:flutter/material.dart';
import 'package:tracker/presentation/resources/routes_manager.dart';
import 'package:provider/provider.dart';
import '../presentation/main/main_view_model.dart';
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> MainViewModel() )
      ],
      child: const  MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesGenerator.getRoute,
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}
