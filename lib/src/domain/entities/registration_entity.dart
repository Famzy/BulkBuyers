import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String email;
  final String password;
  final String fname;
  final String lname;
  final String phone;

  RegisterEntity(
      {this.email, this.password, this.fname, this.lname, this.phone})
      : super([email, password, fname, lname, phone]);
}

class ResetEntity extends Equatable {
  final String email;

  ResetEntity({this.email}) : super([email]);
}
