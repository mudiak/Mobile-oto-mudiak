part of 'pages.dart';

class TicketDetailPage extends StatelessWidget {
  String busname = "sdsd";
  String date = "sdsd";
  String time = "sdsd";
  String seat = "sdsd";
  int price = 35000;
  String idorder;
  String nama;
  String start = "sdsd";
  String finish = "sdsd";
  DetailTicket detailTicket = null;

  TicketDetailPage(this.idorder);
  @override
  Widget build(BuildContext context) {
    // DetailTicket.connectToAPI(idorder).then((value) {
    //   detailTicket = value;
    //   busname = detailTicket.bus;
    //   date = detailTicket.tgl;
    //   time = detailTicket.time;
    //   seat = detailTicket.seat;
    //   price = int.parse(detailTicket.price);
    //   idorder = detailTicket.idorder;
    //   start = detailTicket.start;
    //   finish = detailTicket.finish;
    // });

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
        FutureBuilder(
            future: DetailTicket.connectToAPI(idorder).then((value) {
              detailTicket = value;
              busname = detailTicket.bus;
              date = detailTicket.tgl;
              time = detailTicket.time;
              seat = detailTicket.seat;
              price = int.parse(detailTicket.price);
              idorder = detailTicket.idorder;
              start = detailTicket.start;
              finish = detailTicket.finish;
              nama = detailTicket.nama;
            }),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // if (snapshot.hasData) {
              return Container(
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
                      margin: EdgeInsets.all(10),
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
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text(
                                  date + " & " + time.substring(0, 5),
                                  style: GoogleFonts.raleway(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text(
                                  seat,
                                  style: GoogleFonts.openSans(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text(
                                  NumberFormat.currency(
                                              locale: 'id-ID',
                                              symbol: 'Rp. ',
                                              decimalDigits: 0)
                                          .format(price) +
                                      " x 1",
                                  style: GoogleFonts.openSans(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text(
                                  idorder,
                                  style: GoogleFonts.openSans(
                                      fontSize: 16, color: Colors.black),
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
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: GoogleFonts.raleway(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                              Text(nama,
                                  style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Paid",
                                  style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey)),
                              Text(
                                  NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'Rp. ',
                                          decimalDigits: 0)
                                      .format(price),
                                  style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            ],
                          ),
                          Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DialogPopUp("" +
                                            idorder +
                                            "#" +
                                            busname +
                                            "#" +
                                            start +
                                            "#" +
                                            finish);
                                      });
                                },
                                child: QrImage(
                                    version: 3,
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.black,
                                    data: "" +
                                        idorder +
                                        "#" +
                                        busname +
                                        "#" +
                                        start +
                                        "#" +
                                        finish),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              );
              // } else {
              //   return Center(
              //     child: Container(
              //       height: 100,
              //       child: LottieBuilder.asset("assets/loading.json"),
              //     ),
              //   );
              // }
            }),
      ],
    )));
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0.0, size.height * 0.20);
    path.lineTo(0.0, size.height * 0.60);
    path.quadraticBezierTo(0, size.height * 0.80, 15, size.height * 0.80);
    path.lineTo(size.width - 20, size.height * 0.80);
    path.quadraticBezierTo(
        size.width - 10, size.height - 10, size.width, size.height);
    path.quadraticBezierTo(
        size.width - 10, size.height * 0.90, size.width - 10, 15.0);
    path.quadraticBezierTo(size.width - 12, 0.0, size.width - 30, 0.0);
    path.lineTo(15.0, 0.0);
    path.quadraticBezierTo(0.0, 0.0, 0.0, size.height * 0.20);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
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
