part of 'models.dart';

class EditModel {
  String name;
  String username;
  String email;
  int wallet;
  String pathPicture;

  EditModel(
      {this.name, this.username, this.email, this.wallet, this.pathPicture});

  factory EditModel.Updatedata(Map<String, dynamic> object) {
    return EditModel(
        name: object['name'],
        username: object['id_customer'],
        email: object['email'],
        wallet: int.parse(object['wallet']),
        pathPicture: object['pathPicture']);
  }
  static Future<EditModel> postWithFoto(
      String name, String username, String email, String pathfoto) async {
    var apiURL = Uri.parse(url + "customers.php?page=editwithfoto");

    // print(pathfoto);
    var apiResult = await http.post(apiURL, body: {
      "name": name,
      "image": pathfoto,
      "username": username,
      "email": email
    });

    var jsonObject = json.decode(apiResult.body);
    // print("sdfkljdkgdkj " + jsonObject.toString());

    return EditModel.Updatedata(jsonObject);
  }

  static Future<EditModel> postWithoutFoto(
      String name, String username, String email) async {
    var apiURL = Uri.parse(url + "customers.php?page=editwithoutfoto");

    // print(pathfoto);
    var apiResult = await http.post(apiURL, body: {
      "name": name.toString(),
      "username": username.toString(),
      "email": email.toString()
    });

    var jsonObject = json.decode(apiResult.body);
    print("sdfkljdkgdkj " + jsonObject.toString());
    print(name);
    print(username);
    print(email);
    return EditModel.Updatedata(jsonObject);
  }
}
