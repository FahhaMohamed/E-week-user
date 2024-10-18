import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/navigation/bottom_nav.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseMessaging.instance.subscribeToTopic("EWeekNotification");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BottomNav(),
      theme: ThemeData(
          fontFamily: 'GlacialIndifference',
          iconTheme: const IconThemeData(color: AppColors.iconColor),
          scaffoldBackgroundColor: AppColors.backgroundColor,),
    );
  }
}
