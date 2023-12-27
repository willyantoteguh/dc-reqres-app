class UserRequest {
  final int? id;
  final String? name;
  final String? job;

  UserRequest({
    this.id,
    this.name,
    this.job,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'job': job};
  }
}
