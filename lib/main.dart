import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/config/data/local/user_local_impl.dart';
import 'app/config/data/local/user_local_interface.dart';
import 'app/config/routes/app_pages.dart';
import 'app/config/services/http/http_service_impl.dart';
import 'app/config/services/http/http_services.dart';
import 'init_db.dart';

// This widget is the starting point.
void main() async {
  Get.lazyPut<HttpService>(()=>HttpServiceImpl());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Jekawin Mobile App",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Colors.transparent,
        ),
        primaryColor: Colors.white,
        canvasColor: Colors.white,
      ), // remove literal color declarations
    );
  }
}
