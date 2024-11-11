import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/delete_memory.dart';
import 'package:user/views/landing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.detached ||
        state == AppLifecycleState.inactive) {
      onAppClose();
    }
  }

  void onAppClose() {
    deleteMemory();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
      title: "E-Week 24",
      theme: ThemeData(
        fontFamily: 'GlacialIndifference',
        iconTheme: const IconThemeData(color: AppColors.iconColor),
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
    );
  }
}
