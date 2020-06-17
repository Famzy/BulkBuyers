import 'package:bulk_buyers/src/data/repository.dart';

import 'base_model.dart';
export 'package:bulk_buyers/src/enums/view_state.dart';
class WelcomeViewModel extends BaseModel {
  var repo = Repository();
var status;
 refreshShop() async{
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