import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_cart/view/client_cart.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_favorites/view/client_favorite.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_home/view/client_home.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_search/view/client_search.dart';
import 'package:four_apps_in_one_multi_user_app/auth_gate.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/routes/routes_names.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register_sutibale_page_to_view/logic/auth_gate_cubit/auth_gate_cubit.dart';

class AppRoutes {
  Route? onGenerateRoutes(RouteSettings settings) {
    final authCubit = AuthGateCubit();
    switch (settings.name) {
      case RoutesNames.authGatePage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => authCubit,
            child: const AuthGate(),
          ),
        );
      case RoutesNames.clientHome:
        return MaterialPageRoute(builder: (context) => const ClientHome());
      case RoutesNames.clientFavorite:
        return MaterialPageRoute(builder: (context) => const ClientFavorite());
      case RoutesNames.clientCart:
        return MaterialPageRoute(builder: (context) => const ClientCart());
      case RoutesNames.clientSearch:
        return MaterialPageRoute(builder: (context) => const ClientSearch());

      default:
        return MaterialPageRoute(builder: (context) => const AuthGate());
    }
  }
}
