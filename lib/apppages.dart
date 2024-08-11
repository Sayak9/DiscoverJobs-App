import 'package:discoverjobs/login.dart';
import 'package:get/get.dart';

import 'home.dart';


class AppPages {

  static final routes = [
    GetPage(name: '/home', page: () => Home()),
    GetPage(name: '/login', page: () => LoginPage()),
  ];
}
