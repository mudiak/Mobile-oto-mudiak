import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oto_mudiak/model/bus.dart';
import 'package:oto_mudiak/shared/services.dart';

class BusProvider extends ChangeNotifier {
  getListBus() async {
    var result = await http.get(Uri.parse(url + 'listBus.php'));

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
}
