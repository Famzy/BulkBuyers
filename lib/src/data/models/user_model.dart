import 'package:bulk_buyers/src/domain/entities/user_entities.dart';
import 'package:meta/meta.dart';

class UserModels extends UserEntities {
  UserModels(
      {@required userid,
      @required stateid,
      @required fname,
      @required lname,
      @required dob,
      @required address,
      @required email,
      @required phone,
      @required profileimg,
      @required created_at})
      : super(
            userid: userid,
            stateid: stateid,
            fname: fname,
            lname: lname,
            dob: dob,
            address: address,
            email: email,
            phone: phone,
            profileimg: profileimg,
            created_at: created_at);

  factory UserModels.fromJson(Map<String, dynamic> data) => UserModels(
      phone: data['phone'],
      userid: data['userid'],
      stateid: data['stateid'],
      fname: data['fname'],
      lname: data['lname'],
      dob: data['dob'],
      address: data['address'],
      email: data['email'],
      profileimg: data['profileimg'],
      created_at: data['created_at']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> update = new Map<String, dynamic>();
    update['fname'] = fname;
    update['lname'] = lname;
    update['address'] = address;
    update['userid'] = userid;
    update['stateid'] = stateid;
    update['dob'] = dob;
    update['email'] = email;
    update['phone'] = phone;
    update['profileimg'] = profileimg;
    update['created_at'] = created_at;
    return update;
  }
}
