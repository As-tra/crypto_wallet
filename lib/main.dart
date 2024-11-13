import 'package:crypto_wallet/utils/app_router.dart';
import 'package:crypto_wallet/utils/register_services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await registerServices();
  await setUpControllers();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routes,
      initialRoute: AppRouter.home,
    );
  }
}
