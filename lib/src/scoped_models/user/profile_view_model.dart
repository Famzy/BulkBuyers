import 'package:bulk_buyers/src/data/local/database_helper.dart';
import 'package:bulk_buyers/src/data/remote/model/store_api_provider.dart';
import 'package:bulk_buyers/src/data/repository.dart';
import 'package:bulk_buyers/src/models/user_model.dart';

import '../base_model.dart';

class ProfileViewModel extends BaseModel {
  var db = DatabaseHelper();
  var repo = Repository();
  var api = ApiProvider();
  List data;
  User user = User();

  String email;
  String address;
  String dob;
  String firstName;
  String fullname;
  String lastName;
  int phone;
  var totalOrders;
  String joined;
  String updateMsg = "";
  bool isSuccessful = false;

  loadUserDetails() async {
    // var res = repo.fetchUser();
    totalOrders = await db.getOrderCount();
    data = await db.getUsers();
    email = data[0]['email'];
    fullname = "${data[0]['fname']} ${data[0]['lname']}";
    var date = "${data[0]['created_at']}";
    var d1 = date[0];
    var d2 = date[1];
    var d3 = date[2];
    var d4 = date[3];
    var d6 = date[5];
    var d7 = date[6];
    var d9 = date[8];
    var d10 = date[9];
    firstName = data[0]['fname'];
    lastName = data[0]['lname'];
    phone = data[0]['phone'];
    address = data[0]['address'];
    dob = data[0]['dob'];

    joined = "$d9$d10/$d6$d7/$d1$d2$d3$d4";
    notifyListeners();
  }

  updateUserDetails(String fname, String lname, String Useraddress,
      String dateOfBirth) async {
    data = await db.getUsers();
    if (fname.isEmpty) {
      fname = data[0]['fname'];
    }
    if (lname.isEmpty) {
      lname = data[0]['lname'];
    }
    if (Useraddress.isEmpty) {
      Useraddress = data[0]['address'];
    }
    if (dateOfBirth.isEmpty) {
      dateOfBirth = data[0]['dob'];
    }
    data = await db.getUsers();
    print("$fname $lname $Useraddress $dateOfBirth");
    int UserId = data[0]['userid'];

    var response = await api.updateProfile(User(
        fname: fname, lname: lname, address: Useraddress, dob: dateOfBirth));
    print(response);
    if (response == 200) {
      db.updateUserDeatails(UserId, fname, lname, Useraddress, dateOfBirth);
      updateMsg = "Profile Updated Succefully";
      isSuccessful = true;
    } else {
      updateMsg = "All fields are required";
      isSuccessful = false;
    }
    this.loadUserDetails();
    notifyListeners();
  }
}
