import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_login_register_state.dart';

class SplashLoginRegisterCubit extends Cubit<SplashLoginRegisterState> {
  SplashLoginRegisterCubit() : super(SplashLoginRegisterInitial());
}
