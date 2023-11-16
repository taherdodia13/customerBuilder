class UserListResponseModel {
  int currentPage = 0;
  List<Data> data = const [];
  String? firstPageUrl;
  int from = 0;
  int lastPage = 0;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int perPage = 0;
  String? prevPageUrl;
  int to = 0;
  int total = 0;

  UserListResponseModel({
    this.currentPage = 0,
    this.data = const [],
    this.firstPageUrl,
    this.from = 0,
    this.lastPage = 0,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage = 0,
    this.prevPageUrl,
    this.to = 0,
    this.total = 0,
  });

  UserListResponseModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'] ?? 0;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'] ?? 0;
    prevPageUrl = json['prev_page_url'];
    to = json['to'] ?? 0;
    total = json['total'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Data {
  int userId = 0;
  String? password;
  String? email;
  int id = 0;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.userId = 0,
      this.password,
      this.email,
      this.id = 0,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
