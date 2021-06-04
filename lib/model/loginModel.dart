part of 'models.dart';

class LoginModel {
  String response;
  int kode;
  String name;
  String username;
  String email;
  String pathPicture;

  LoginModel(
      {this.response,
      this.kode,
      this.name,
      this.username,
      this.email,
      this.pathPicture});

  factory LoginModel.loginCustomer(Map<String, dynamic> object) {
    return LoginModel(
        response: object['response'],
        kode: object['kode'],
        name: object['name'],
        username: object['username'],
        email: object['email'],
        pathPicture: object['pathPicture']);
  }
  static Future<LoginModel> connectToAPI(
      String emailoruser, String password) async {
    var apiURL = Uri.parse("http://192.168.0.105/oto_mudiak/API/login.php");

    var apiResult = await http
        .post(apiURL, body: {"username": emailoruser, "password": password});

    var jsonObject = json.decode(apiResult.body);

    return LoginModel.loginCustomer(jsonObject);
  }
}
