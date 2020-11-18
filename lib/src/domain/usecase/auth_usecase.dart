import 'package:bulk_buyers/src/data/models/login_model.dart';
import 'package:bulk_buyers/src/data/models/registration_model.dart';
import 'package:bulk_buyers/src/domain/entities/registration_entity.dart';
import 'package:bulk_buyers/src/domain/repository/repository.dart';

class AuthUC {
  final Repository repository;

  AuthUC(this.repository);

  login(LoginModel login) async => await repository.login(login);
  register(RegisterModel registerModel) async =>
      await repository.signup(registerModel);
  reset(ResetModel reset) async => await repository.reset(reset);
}
