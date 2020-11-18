import 'package:equatable/equatable.dart';

class UserEntities extends Equatable {
  final int userid;
  final int stateid;
  final String fname;
  final String lname;
  final String dob;
  final String address;
  final String email;
  final String profileimg;
  final String phone;
  final String created_at;

  UserEntities(
      {this.userid,
      this.stateid,
      this.fname,
      this.lname,
      this.dob,
      this.address,
      this.email,
      this.phone,
      this.profileimg,
      this.created_at})
      : super([
          userid,
          stateid,
          fname,
          lname,
          dob,
          address,
          email,
          phone,
          profileimg,
          created_at
        ]);
}
