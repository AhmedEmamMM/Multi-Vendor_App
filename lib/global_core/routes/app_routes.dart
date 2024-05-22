import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/auth_gate.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/routes/routes_names.dart';

class AppRoutes {
  Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.authGatePage:
        return MaterialPageRoute(builder: (context) => const AuthGate());
      default:
        return MaterialPageRoute(builder: (context) => const AuthGate());
    }
  }
}
