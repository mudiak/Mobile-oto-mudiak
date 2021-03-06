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

  getListBusLokasi(String lokasi) async {
    var result = await http.get(
        Uri.parse(url + 'listBus.php?page=listcarilokasi&lokasi=' + lokasi));

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
    Get.off(MainPage(
      initialPage: 1,
    ));
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

  getListTicketNow(String username) async {
    var result = await http.get(
        Uri.parse(url + 'listBus.php?page=listticket&username=' + username));

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Ticket> ticket = data.map((item) => Ticket.fromJson(item)).toList();
      return ticket;
    } else {
      return <Ticket>[];
    }
  }

  getListTicketexpired(String username) async {
    var result = await http.get(Uri.parse(
        url + 'listBus.php?page=listticketexpired&username=' + username));

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Ticket> ticket = data.map((item) => Ticket.fromJson(item)).toList();
      return ticket;
    } else {
      return <Ticket>[];
    }
  }

  getListLokasi() async {
    var result = await http.get(Uri.parse(url + 'listBus.php?page=listlokasi'));

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Lokasi> lokasi = data.map((item) => Lokasi.fromJson(item)).toList();
      return lokasi;
    } else {
      return <Lokasi>[];
    }
  }
}

class Lokasi {
  String start_address;
  Lokasi(this.start_address);

  Lokasi.fromJson(json) {
    start_address = json['start_address'];
  }
}
