part of 'models.dart';

class RegisterModel {
  String response;
  int kode;

  RegisterModel({this.response, this.kode});

  factory RegisterModel.createCustomer(Map<String, dynamic> object) {
    return RegisterModel(response: object['response'], kode: object['kode']);
  }

  static Future<RegisterModel> connectToAPI(
      String id_customer, String name, String email, String password) async {
    var apiURL = Uri.parse(url + "register.php?aksi=db");

    var apiResult = await http.post(apiURL, body: {
      "id_customer": id_customer,
      "name": name,
      "email": email,
      "password": password
    });

    var jsonObject = json.decode(apiResult.body);

    return RegisterModel.createCustomer(jsonObject);
  }
}

class GantiPassword {
  String response;
  int kode;

  GantiPassword({this.response, this.kode});

  factory GantiPassword.gantiPassword(Map<String, dynamic> object) {
    return GantiPassword(response: object['response'], kode: object['kode']);
  }

  static Future<GantiPassword> connectToAPI(
      String username, String oldPassword, String newPassword) async {
    var apiURL = Uri.parse(url + "gantipassword.php");

    var apiResult = await http.post(apiURL, body: {
      "username": username,
      "oldPassword": oldPassword,
      "newPassword": newPassword,
    });

    var jsonObject = json.decode(apiResult.body);

    return GantiPassword.gantiPassword(jsonObject);
  }
}
