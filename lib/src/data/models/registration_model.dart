import 'package:bulk_buyers/src/domain/entities/registration_entity.dart';
import 'package:meta/meta.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel(
      {@required email,
      @required password,
      @required fname,
      @required lname,
      @required phone})
      : super(
            email: email,
            password: password,
            fname: fname,
            lname: lname,
            phone: phone);

  factory RegisterModel.formJson(Map<String, dynamic> json) {
    return RegisterModel(
        email: json['email'],
        password: json['password'],
        fname: json['fname'],
        lname: json["lname"],
        phone: json['phone']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> register = new Map<String, dynamic>();

    register['email'] = email;
    register['password'] = password;
    register['fname'] = fname;
    register['lname'] = lname;
    register['phone'] = phone;
    return register;
  }
}

class ResetModel extends ResetEntity {
  ResetModel({@required email}) : super(email: email);

  factory ResetModel.formJson(Map<String, dynamic> json) {
    return ResetModel(
      email: json['email'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> reset = new Map<String, dynamic>();

    reset['email'] = email;
    return reset;
  }
}
