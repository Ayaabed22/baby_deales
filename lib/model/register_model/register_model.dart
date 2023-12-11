class RegisterModel  {
  RegisterModel ({
     this.data,
     this.message,
     this.status,
  });
  Data? data;
  String? message;
  int? status;

  RegisterModel .fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data?.toJson();
    _data['message'] = message;
    _data['status'] = status;
    return _data;
  }
}

class Data {
  Data({
     this.id,
     this.name,
     this.address,
     this.phone,
     this.type,
    this.active,
  });
   int? id;
   String? name;
   String? address;
   String? phone;
   String? type;
   bool? active;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    type = json['type'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['address'] = address;
    _data['phone'] = phone;
    _data['type'] = type;
    _data['active'] = active;
    return _data;
  }
}