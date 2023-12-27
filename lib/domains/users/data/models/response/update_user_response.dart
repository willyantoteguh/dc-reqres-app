class UpdateUserResponse {
  String? name;
  String? job;
  String? updatedAt;

  UpdateUserResponse({this.name, this.job, this.updatedAt});

  UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['job'] = job;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
