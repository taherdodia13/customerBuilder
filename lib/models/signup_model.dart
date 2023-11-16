class SignUpResponseModel {
  int userId = 0;
  String? password;
  String? email;
  int id = 0;
  String? createdAt;
  String? updatedAt;

  SignUpResponseModel(
      {this.userId = 0,
      this.password,
      this.email,
      this.id = 0,
      this.createdAt,
      this.updatedAt});

  SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] ?? 0;
    password = json['password'];
    email = json['email'];
    id = json['id'] ?? 0;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['password'] = password;
    data['email'] = email;
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class SignUpInputModel {
  String? email;
  String? password;

  SignUpInputModel({this.email, this.password});

  SignUpInputModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

class UserData {
  // int userId = 0;
  String? password;
  String? email;
  int id = 0;
  String? createdAt;
  String? updatedAt;

  UserData(
      {
      // this.userId = 0,
      this.password,
      this.email,
      this.id = 0,
      this.createdAt,
      this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    // userId = json['userId'] ?? 0;
    password = json['password'];
    email = json['email'];
    id = json['id'] ?? 0;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['userId'] = userId;
    data['password'] = password;
    data['email'] = email;
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
