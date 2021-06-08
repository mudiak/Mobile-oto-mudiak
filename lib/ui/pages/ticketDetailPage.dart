part of 'pages.dart';

class TicketDetailPage extends StatelessWidget {
  String busname = "sdsd";
  String date = "sdsd";
  String time = "sdsd";
  String seat = "sdsd";
  int price = 35000;
  String idorder = "S0105hanifasF4";
  String start = "sdsd";
  String finish = "sdsd";
  DetailTicket detailTicket = null;
  // TicketDetailPage(this.busname, this.date, this.seat, this.price, this.idorder,
  //     this.start, this.finish);
  @override
  Widget build(BuildContext context) {
    DetailTicket.connectToAPI(idorder).then((value) {
      busname = value.bus;
      date = value.tgl;
      time = value.time;
      seat = value.seat;
      price = int.parse(value.price);
      idorder = value.idorder;
      start = value.start;
      finish = value.finish;
    });

    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 40, 40, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    margin: EdgeInsets.only(right: 26),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/actionbar_title.png"))),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: Text("Ticket Details",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(start,
                          style: GoogleFonts.raleway(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 25,
                          child: Image.asset("assets/oto.png"),
                        ),
                        Container(
                            height: 2,
                            width: MediaQuery.of(context).size.width / 4,
                            margin: EdgeInsets.all(5),
                            child: DottedLine(
                              dashColor: "FBD460".toColor(),
                              lineThickness: 3,
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(finish,
                          style: GoogleFonts.raleway(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    )
                  ],
                ),
              ),
              Container(
                  height: 2,
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  child: DottedLine(
                    dashColor: "E4E4E4".toColor(),
                    lineThickness: 3,
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            "Bus",
                            style: GoogleFonts.raleway(
                                fontSize: 20, color: Colors.grey),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            "Date & Time",
                            style: GoogleFonts.raleway(
                                fontSize: 20, color: Colors.grey),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            "Seat Number",
                            style: GoogleFonts.raleway(
                                fontSize: 20, color: Colors.grey),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            "Seat",
                            style: GoogleFonts.raleway(
                                fontSize: 20, color: Colors.grey),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            "ID Order",
                            style: GoogleFonts.raleway(
                                fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            busname,
                            style: GoogleFonts.openSans(
                                fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            date + " & " + time,
                            style: GoogleFonts.raleway(
                                fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            seat,
                            style: GoogleFonts.openSans(
                                fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            "Rp. " + price.toString() + " x 1",
                            style: GoogleFonts.openSans(
                                fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            idorder,
                            style: GoogleFonts.openSans(
                                fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 2,
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  child: DottedLine(
                    dashColor: "E4E4E4".toColor(),
                    lineThickness: 3,
                  )),
              Container(
                margin: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: GoogleFonts.raleway(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                        Text("Hanif AS",
                            style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Paid",
                            style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)),
                        Text("Rp. 35.000",
                            style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      ],
                    ),
                    Container(height: 100, child: Image.asset("assets/qr.png"))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    )));
  }
}

class TicketTopClipper extends CustomClipper<Path> {
  double radius = 15;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(radius, size.height - radius, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(size.width - radius, size.height - radius,
        size.width, size.height - radius);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TicketBottomClipper extends CustomClipper<Path> {
  double radius = 15;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width - radius, radius, size.width - radius, 0);
    path.lineTo(radius, 0);
    path.quadraticBezierTo(radius, radius, 0, radius);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
