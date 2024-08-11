import 'package:discoverjobs/home.dart';
import 'package:discoverjobs/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'apppages.dart';
import 'controller.dart';
import 'firebase_options.dart';
import 'login.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isUserLoggedIn') ?? false;
  Get.put(HomeController(), permanent: true);

  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Discover Jobs',
        home: isLoggedIn ? Home() : SplashScreen(child: LoginPage()),
        getPages: AppPages.routes,
      ),
    );

}
