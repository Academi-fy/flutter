import 'dart:ffi';

import 'package:rotteck_messenger/domain/entities/users/user.dart';

class UserAccount {

  late User user;
  late String username;
  late String password;
  late List<Object>? settings;
  late List<String> permissions;

  UserAccount({
    required this.user,
    required this.username,
    required this.password,
    this.settings,
    required this.permissions
  });

}