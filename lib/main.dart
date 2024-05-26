import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'global_core/constants/constants.dart';
import 'global_core/providers/cart_provider.dart';
import 'global_core/routes/app_routes.dart';
import 'global_core/routes/routes_names.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: MyApp(appRoutes: AppRoutes()),
  ));
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
          theme: ThemeData(scaffoldBackgroundColor: kPrimary),
          initialRoute: RoutesNames.authGatePage,
          onGenerateRoute: appRoutes.onGenerateRoutes,
        );
      },
    );
  }
}
