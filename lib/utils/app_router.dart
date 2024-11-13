import 'package:crypto_wallet/views/home_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static String home = '/home';

  static Map<String,Widget Function(BuildContext)> routes = {
    home: (context) => const HomeView(),
  };
}
