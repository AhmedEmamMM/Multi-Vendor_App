import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/routes/app_routes.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/routes/routes_names.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(appRoutes: AppRoutes()));
}

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes;
  const MyApp({super.key, required this.appRoutes});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: Colors.amber.shade300),
          initialRoute: RoutesNames.authGatePage,
          onGenerateRoute: appRoutes.onGenerateRoutes,
        );
      },
    );
  }
}
