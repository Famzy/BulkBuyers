import 'package:bulk_buyers/src/data/repository/repository_impl.dart';

import 'base_model.dart';

class WelcomeViewModel extends BaseModel {
  var repo = RepositoryImpl();
  var status;
  refreshShop() async {
    var response = await repo.refreshProducts();
    print(response);
    await Future.delayed(Duration(seconds: 10));

    bool ok = true;
    status = ok;
    print("done with state");
    notifyListeners();
    return ok;
  }
}
