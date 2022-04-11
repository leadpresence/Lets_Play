import '../model/user.dart';

abstract class UserLocalDataSourceInterface {
  void deleteUser(int userId);
  void clearUserBox();
  Future<void> saveUser(User userData);
  Future<void> saveUserPassword(String password);
  User getUserById(int userId);
  Future<void> cacheLoggedInUser(User userData);
}
