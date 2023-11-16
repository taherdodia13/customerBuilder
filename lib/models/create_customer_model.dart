class CreateCustomerResponseModel {
  int userId = 0;
  String? name;
  String? desc;
  String? email;
  int phone = 0;
  int id = 0;
  String? createdAt;
  String? updatedAt;

  CreateCustomerResponseModel(
      {this.userId = 0,
      this.name,
      this.desc,
      this.email,
      this.phone = 0,
      this.id = 0,
      this.createdAt,
      this.updatedAt});

  CreateCustomerResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] ?? 0;
    name = json['name'];
    desc = json['desc'];
    email = json['email'];
    phone = json['phone'] ?? 0;
    id = json['id'] ?? 0;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['name'] = name;
    data['desc'] = desc;
    data['email'] = email;
    data['phone'] = phone;
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class CreateCustomerInputModel {
  int userId = 0;
  String? email;
  String? name;
  String? desc;
  int phone = 0;

  CreateCustomerInputModel(
      {this.userId = 0, this.email, this.name, this.desc, this.phone = 0});

  CreateCustomerInputModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] ?? 0;
    email = json['email'];
    name = json['name'];
    desc = json['desc'];
    phone = json['phone'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['email'] = email;
    data['name'] = name;
    data['desc'] = desc;
    data['phone'] = phone;
    return data;
  }
}
