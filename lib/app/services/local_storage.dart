import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static saveToken(String tokenValue) {
    return GetStorage().write("token", tokenValue);
  }

  static saveEmail(String emailValue) {
    return GetStorage().write("email", emailValue);
  }

  static saveGameSession(String gameSessionValue) {
    return GetStorage().write("gameSession", gameSessionValue);
  }

  static saveClubId(String clubId) {
    return GetStorage().write("clubId", clubId);
  }

  static saveUserId(String userId) {
    return GetStorage().write("currentUserID", userId);
  }

  static getToken() {
    return GetStorage().read("token");
  }

  static getClubId() {
    return GetStorage().read("clubId");
  }

  static getUserId() {
    return GetStorage().read("currentUserID");
  }

  static getEmail() {
    return GetStorage().read("email");
  }

  static getGameSession() {
    return GetStorage().read("gameSession");
  }

  static deleteToken() {
    return GetStorage().remove("token");
  }

  static saveUsername(String userName) {
    return GetStorage().write('name', userName);
  }

  static getUsername() {
    return GetStorage().read('name');
  }
}
