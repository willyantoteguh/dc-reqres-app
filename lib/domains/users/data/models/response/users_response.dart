class UserResponse {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserDto>? data;

  UserResponse(
      {this.page, this.perPage, this.total, this.totalPages, this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <UserDto>[];
      json['data'].forEach((v) {
        data!.add(UserDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    data['total'] = total;
    data['total_pages'] = totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDto {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserDto({this.id, this.email, this.firstName, this.lastName, this.avatar});

  UserDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}