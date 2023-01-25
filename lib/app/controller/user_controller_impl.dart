import 'dart:developer';

import 'package:pomodoro/app/database/db_pomodoro.dart';
import 'package:pomodoro/app/models/user.dart';

import './user_controller.dart';

class UserControllerImpl implements UserController {
  @override
  Future<void> deleteUser(User user) {
    throw UnimplementedError();
  }

  @override
  Future<void> login(String email, String password) async {
    final user = await DbPomodoro.db.getUser('users', email);
    log(user.toString());
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<void> registerUser(User user) async {
    await DbPomodoro.db.insert('users', user.toMap());
  }

  @override
  Future<void> updateUser(User user) {
    throw UnimplementedError();
  }
}
