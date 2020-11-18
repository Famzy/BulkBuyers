import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String email;
  final String password;

  LoginEntity({this.email, this.password}) : super([email, password]);
}
