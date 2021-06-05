part of 'models.dart';

class LoginModel {
  String response;
  int kode;
  String name;
  String username;
  String email;
  int wallet;
  String pathPicture;

  LoginModel(
      {this.response,
      this.kode,
      this.name,
      this.username,
      this.email,
      this.wallet,
      this.pathPicture});

  factory LoginModel.loginCustomer(Map<String, dynamic> object) {
    return LoginModel(
        response: object['response'],
        kode: object['kode'],
        name: object['name'],
        username: object['username'],
        email: object['email'],
        wallet: int.parse(object['wallet']),
        pathPicture: object['pathPicture']);
  }
  static Future<LoginModel> connectToAPI(
      String emailoruser, String password) async {
    var apiURL = Uri.parse(url + "/login.php");

    var apiResult = await http
        .post(apiURL, body: {"username": emailoruser, "password": password});

    var jsonObject = json.decode(apiResult.body);

    return LoginModel.loginCustomer(jsonObject);
  }
}
