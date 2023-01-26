abstract class UserController {
  Future<void> login(String email, String password);
  Future<void> logout();
  Future<void> registerUser(String email, String password, String userName);
  Future<void> updateUser(String email, String password, String userName, int id);
  Future<void> deleteUser(int id);
}
