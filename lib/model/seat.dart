class Seat {
  String seat;

  Seat({this.seat});

  Seat.fromJson(json) {
    seat = json['seat_number'];
  }
}
