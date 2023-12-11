class UserAccountEntity {
  late dynamic user;
  late String username;
  late String password;
  late List<dynamic>? settings;
  late List<dynamic> permissions;

  UserAccountEntity(
      {required this.user,
      required this.username,
      required this.password,
      this.settings,
      required this.permissions});
}
