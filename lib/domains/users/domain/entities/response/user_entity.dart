class UserEntity {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;

  UserEntity({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });
}

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
}
