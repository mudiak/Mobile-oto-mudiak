import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:oto_mudiak/model/bus.dart';
import 'package:oto_mudiak/model/models.dart';
import 'package:oto_mudiak/model/seat.dart';
import 'package:oto_mudiak/shared/services.dart';
import 'package:oto_mudiak/ui/pages/pages.dart';

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

  static Future<String> postCheckOut(String idorder, String idbus,
      String username, String seat, String price) async {
    var apiURL = Uri.parse(url + "listBus.php?page=checkout");

    var apiResult = await http.post(apiURL, body: {
      "idorder": idorder,
      "idbus": idbus,
      "username": username,
      "seat": seat,
      "price": price
    });

    var jsonObject = json.decode(apiResult.body);
    print(jsonObject['response']);
    Get.off(TicketDetailPage());
    return jsonObject['response'];
  }

  getListSeat(String idbus) async {
    var result = await http
        .get(Uri.parse(url + 'listBus.php?page=cekSeat&idbus=' + idbus));

    print(result.statusCode);
    print(result.body);
    List data = jsonDecode(result.body);
    List<Seat> seat = data.map((item) => Seat.fromJson(item)).toList();
    return seat;
  }

  // getDetailTicket(String idorder) async {
  //   var result = await http
  //       .get(Uri.parse(url + 'listBus.php?page=detail&idorder=' + idorder));

  //   print(result.statusCode);
  //   print(result.body);

  //   if (result.statusCode == 200) {
  //     List data = jsonDecode(result.body);
  //     List<DetailTicket> detailticket =
  //         data.map((item) => DetailTicket.fromJson(item)).toList();
  //     return detailticket;
  //   } else {
  //     return <DetailTicket>[];
  //   }
  // }
}
