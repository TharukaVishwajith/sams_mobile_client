import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sams/model/staff_model.dart';

// enum AuthEvents {login,signup,logout}

abstract class AuthEvents {}

class Login extends AuthEvents {}

class Logout extends AuthEvents {}

class Signup extends AuthEvents {}


class AuthBloc extends Bloc<AuthEvents, Staff>{

  AuthBloc() : super(Staff.defaultData()) {
    on<Login>((event, emit) => emit(state));
    on<Logout>((event, emit) => emit(state));
  }
}