part of 'shared.dart';

class SharePreferencesHelper {
  final String isLogin = "isLogin";
  final String email = "email";
  final String username = "username";
  final String wallet = "wallet";
  final String pathPicture = "pathPicture";

  Future<void> setLogin(bool isLogin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(this.isLogin, isLogin);
  }

//get value from shared preferences
  Future<bool> getLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool isLogin;
    isLogin = pref.getBool(this.isLogin) ?? false;
    return isLogin;
  }

  Future<void> setEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.email, email);
  }

//get value from shared preferences
  Future<String> getEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String email;
    email = pref.getString(this.email) ?? null;
    return email;
  }

  Future<void> setWallet(int wallet) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(this.wallet, wallet);
  }

//get value from shared preferences
  Future<int> getWallet() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int wallet;
    wallet = pref.getInt(this.wallet) ?? 0;
    return wallet;
  }

  Future<void> setUsername(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.username, username);
  }

//get value from shared preferences
  Future<String> getUsername() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String username;
    username = pref.getString(this.username) ?? "No Name";
    return username;
  }

  Future<void> setPathPicture(String pathPicture) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.pathPicture, pathPicture);
  }

//get value from shared preferences
  Future<String> getPathPicture() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String pathPicture;
    pathPicture = pref.getString(this.pathPicture) ??
        "https://www.profilepicture7.com//bao/bao_haokan/1/1634803414.jpg";
    return pathPicture;
  }

  Future<String> logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    Get.offAll(SignInPage());
  }
}
