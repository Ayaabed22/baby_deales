class LoginModel {
  LoginModel({
    this.modelData,
    this.message,
    this.status,
  });
  Data? modelData;
  String? message;
  int? status;

  LoginModel.fromJson(Map<String, dynamic> json){
    modelData = Data.fromJson(json['data']);
    message = json['message'];
    status = json['status'];
  }

}

class Data {

  DataModel? loginData;
  late final String token;

  Data({
    required this.loginData,
    required this.token,
  });

  Data.fromJson(Map<String, dynamic> json){
    loginData = DataModel.fromJson(json['data']);
    token = json['token'];
  }

}

class DataModel {
  int? id;
  String? name;
  String? phone;
  String? address ;
  String? type;
  //bool? active;


  DataModel({this.id, this.name, this.phone, this.address, this.type,});

  DataModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name=json['name'];
    phone=json['phone'];
    address=json['address']?? '';
    type=json['type'] ?? '';
   // active=json['active'] ?? ;

  }


}