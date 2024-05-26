import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth_gate/data/repo/user_repo.dart';
import '../../client/features/client_home/view/client_cart.dart';
import '../../client/features/client_home/view/client_home.dart';
import '../../client/features/client_search/view/client_search.dart';
import '../../auth_gate/view/auth_gate.dart';
import 'routes_names.dart';
import '../../auth_gate/logic/auth_gate_cubit.dart';

class AppRoutes {
  Route? onGenerateRoutes(RouteSettings settings) {
    final authCubit = AuthGateCubit(UserRepo());
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
      case RoutesNames.clientCart:
        return MaterialPageRoute(builder: (context) => const ClientCart());
      case RoutesNames.clientSearch:
        return MaterialPageRoute(builder: (context) => const ClientSearch());

      default:
        return MaterialPageRoute(builder: (context) => const AuthGate());
    }
  }
}
