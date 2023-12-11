import 'dart:io';

class User{
  String? name;
  String? phone;
  String? password;
  String? confirmPassword;
  String? address;
  File? photo;
  String? agencyOwner;



  User({this.name, this.phone, this.password, this.confirmPassword,this.address,this.photo,this.agencyOwner});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['password'] = password;
    map['password_confirmation'] =confirmPassword ;
    map['phone']=phone;
    map['address']=address ?? '';
    map['photo']=photo ?? File('');
    map['agency_owner']=agencyOwner ?? '';
    return map;
  }

}

