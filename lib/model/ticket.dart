part of 'models.dart';

class Ticket {
  String id;
  String idbus;
  String idagency;
  String nama;
  String time;
  String date;
  String lama;
  String start;
  String finish;
  int price;

  Ticket(
      {this.id,
      this.idbus,
      this.idagency,
      this.nama,
      this.time,
      this.date,
      this.lama,
      this.start,
      this.finish,
      this.price});

  Ticket.fromJson(json) {
    id = json['id'];
    idbus = json['id_bus'];
    idagency = json['idagency'];
    nama = json['nama'];
    time = json['timestart'];
    date = json['tgl'];
    lama = json['lama'];
    start = json['startaddress'];
    finish = json['finishaddress'];
    price = int.parse(json['price']);
  }
}
