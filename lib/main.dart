import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmsadminpanle/routes/app_routes.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';
import 'utils/helpers/scroll_controller.dart';

String? userId;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final box = GetStorage();
  userId = box.read("userId");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        getPages: AppRoutes.routes,
        initialRoute: userId != null ? "/root" : "/",
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          primaryColor: ColorManager.primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.secularOneTextTheme(),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
        ),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
