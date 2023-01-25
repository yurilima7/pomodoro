import 'package:pomodoro/app/models/user.dart';

abstract class UserController {
  Future<void> login(String email, String password);
  Future<void> logout();
  Future<void> registerUser(User user);
  Future<void> updateUser(User user);
  Future<void> deleteUser(User user);
}
