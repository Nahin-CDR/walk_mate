import 'package:flutter/material.dart';
import 'package:tracker/service/notification_service.dart';
import 'app/app.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  runApp(const MyApp());
}


