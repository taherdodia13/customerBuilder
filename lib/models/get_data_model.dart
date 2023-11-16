class GetDataResponseModel {
  int currentPage = 0;
  List<DataList> data = const [];
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

  GetDataResponseModel(
      {this.currentPage = 0,
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
      this.total = 0});

  GetDataResponseModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'] ?? 0;
    if (json['data'] != null) {
      data = <DataList>[];
      json['data'].forEach((v) {
        data.add(DataList.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'] ?? 0;
    lastPage = json['last_page'] ?? 0;
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

class DataList {
  int userId = 0;
  String? name;
  String? desc;
  String? email;
  int phone = 0;
  int id = 0;
  String? createdAt;
  String? updatedAt;

  DataList(
      {this.userId = 0,
      this.name,
      this.desc,
      this.email,
      this.phone = 0,
      this.id = 0,
      this.createdAt,
      this.updatedAt});

  DataList.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    desc = json['desc'];
    email = json['email'];
    phone = json['phone'] ?? 0;
    id = json['id'];
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
