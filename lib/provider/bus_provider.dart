import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oto_mudiak/model/bus.dart';
import 'package:oto_mudiak/shared/services.dart';

class BusProvider extends ChangeNotifier {
  getListBus() async {
    var result = await http.get(Uri.parse(url + 'listBus.php?page=list'));

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Bus> bus = data.map((item) => Bus.fromJson(item)).toList();
      return bus;
    } else {
      return <Bus>[];
    }
  }

  getWallet(String username) async {
    var result = await http
        .get(Uri.parse(url + 'customers.php?page=wallet&username=' + username));
    var data = jsonDecode(result.body);
    print(result.body);
    print(username);
    String wallet = data['balance'];
    return wallet;
  }

  getNama(String username) async {
    var result = await http
        .get(Uri.parse(url + 'customers.php?page=nama&username=' + username));
    var data = jsonDecode(result.body);
    print(result.body);
    print(username);
    String nama = data['nama'];
    return nama;
  }

  static Future<String> postCheckOut(
      String idbus, String username, String seat, String price) async {
    var apiURL = Uri.parse(url + "listBus.php?page=checkout");

    var apiResult = await http.post(apiURL, body: {
      "idbus": idbus,
      "username": username,
      "seat": seat,
      "price": price
    });

    var jsonObject = json.decode(apiResult.body);
    print(jsonObject['response']);
    return jsonObject['response'];
  }
}
