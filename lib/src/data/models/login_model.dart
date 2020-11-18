import 'package:bulk_buyers/src/domain/entities/login_entity.dart';
import 'package:meta/meta.dart';

class LoginModel extends LoginEntity {
  LoginModel({@required email, @required password})
      : super(email: email, password: password);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> login = new Map<String, dynamic>();
    login['password'] = password;
    login['email'] = email;
    return login;
  }
}
