import 'package:four_apps_in_one_multi_user_app/auth_gate/data/repo/user_repo.dart';
import 'package:four_apps_in_one_multi_user_app/auth_gate/imports/imports.dart';

import '../data/models/user.dart';

part 'auth_gate_state.dart';

class AuthGateCubit extends Cubit<AuthGateState> {
  final UserRepo userRepo;
  AuthGateCubit(this.userRepo) : super(AuthGateInitial());

  

  void getUserData() async {
    emit(GetUserDataLoadingState());
    try {
      await userRepo.getUserData().then((userdata) => emit(GetUserDataSuccessState(userdata)));
    } catch (e) {
      emit(GetUserDataFaliuerState(e.toString()));
    }
  }
}
