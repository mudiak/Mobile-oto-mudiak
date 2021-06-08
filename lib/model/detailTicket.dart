part of 'models.dart';

class DetailTicket {
  String idorder;
  String bus;
  String tgl;
  String time;
  String seat;
  String price;
  String nama;
  String start;
  String finish;

  DetailTicket(
      {this.idorder,
      this.bus,
      this.tgl,
      this.time,
      this.seat,
      this.price,
      this.nama,
      this.start,
      this.finish});
  factory DetailTicket.CekDetail(Map<String, dynamic> object) {
    return DetailTicket(
        idorder: object['idorder'],
        bus: object['bus'],
        tgl: object['tgl'],
        time: object['time'],
        seat: object['seat'],
        price: object['price'],
        nama: object['nama'],
        start: object['start'],
        finish: object['finish']);
  }

  static Future<DetailTicket> connectToAPI(String idorder) async {
    var apiURL = Uri.parse(url + "listBus.php?page=detail&idorder=" + idorder);

    var apiResult = await http.get(apiURL);

    var jsonObject = json.decode(apiResult.body);

    return DetailTicket.CekDetail(jsonObject);
  }

  // DetailTicket.fromJson(json) {
  //   idorder = json['idorder'];
  //   bus = json['bus'];
  //   tgl = json['tgl'];
  //   time = json['time'];
  //   seat = json['seat'];
  //   price = json['price'];
  //   nama = json['nama'];
  //   start = json['start'];
  //   finish = json['finish'];
  // }
}
