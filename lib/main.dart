import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/presentation/resources/theme_manager.dart';
import 'package:tracker/service/notification_service.dart';
import 'app/app.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  runApp(ChangeNotifierProvider<ThemeManager>(
      create: (BuildContext context)=>ThemeManager(),
      child: const MyApp(),
  ));
}


