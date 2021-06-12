part of 'pages.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  SharePreferencesHelper pref = SharePreferencesHelper();
  bool isExpriredTicket = false;
  @override
  Widget build(BuildContext context) {
    var busProvider = Provider.of<BusProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3 / 2,
                color: Colors.lightBlue,
              ),
              SafeArea(
                  child: ClipPath(
                clipper: HeaderClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3 / 2,
                  color: Colors.lightBlue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 24, bottom: 32),
                        child: Text(
                          "My Ticket",
                          style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 25),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isExpriredTicket = !isExpriredTicket;
                                  });
                                },
                                child: Text("Newest",
                                    style: GoogleFonts.raleway(
                                        color: isExpriredTicket
                                            ? Colors.white
                                            : "FBD460".toColor(),
                                        fontSize: 20,
                                        fontWeight: isExpriredTicket
                                            ? FontWeight.w500
                                            : FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                  height: 4,
                                  width: MediaQuery.of(context).size.width / 2,
                                  color: !isExpriredTicket
                                      ? "FBD460".toColor()
                                      : Colors.transparent)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isExpriredTicket = !isExpriredTicket;
                                  });
                                },
                                child: Text("Oldest",
                                    style: GoogleFonts.raleway(
                                        color: isExpriredTicket
                                            ? "FBD460".toColor()
                                            : Colors.white,
                                        fontSize: 20,
                                        fontWeight: isExpriredTicket
                                            ? FontWeight.bold
                                            : FontWeight.w500)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                  height: 4,
                                  width: MediaQuery.of(context).size.width / 2,
                                  color: isExpriredTicket
                                      ? "FBD460".toColor()
                                      : Colors.transparent)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
          Expanded(
              child: FutureBuilder(
                  future: pref.getUsername(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return (isExpriredTicket == false)
                        ? FutureBuilder(
                            future: busProvider
                                .getListTicketNow(snapshot.data.toString()),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                String kode = "";

                                List<Ticket> data = snapshot.data;
                                data.map((e) => kode = e.idbus).toList();
                                print(kode);
                                if (kode == null) {
                                  return Container(
                                    height: 100,
                                    width: 200,
                                    child: Center(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        LottieBuilder.asset("assets/data.json"),
                                      ],
                                    )),
                                  );
                                } else {
                                  return ListView(
                                    children: data.map((item) {
                                      // if (item.idbus.toString() == "0") {
                                      //   return Container();
                                      // } else {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            // top: index == 1 ? 0 : 30,
                                            ),
                                        child: GestureDetector(
                                            onTap: () {
                                              Get.to(TicketDetailPage(item.id));
                                            },
                                            child: ItemMyTicket(
                                                item, isExpriredTicket)),
                                      );
                                      // }
                                    }).toList(),
                                  );
                                }
                              }

                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          )
                        : FutureBuilder(
                            future: busProvider
                                .getListTicketexpired(snapshot.data.toString()),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                String kode = "";

                                List<Ticket> data = snapshot.data;
                                data.map((e) => kode = e.idbus).toList();
                                print(kode);
                                if (kode == null) {
                                  return Container(
                                    height: 100,
                                    width: 200,
                                    child: Center(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        LottieBuilder.asset("assets/data.json"),
                                        Text("Data Is Empty")
                                      ],
                                    )),
                                  );
                                } else {
                                  return ListView(
                                    children: data.map((item) {
                                      // if (item.idbus.toString() == "0") {
                                      //   return Container();
                                      // } else {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            // top: index == 1 ? 0 : 30,
                                            ),
                                        child: ItemMyTicket(
                                            item, isExpriredTicket),
                                      );
                                      // }
                                    }).toList(),
                                  );
                                }
                              }

                              return Center(
                                  child: LottieBuilder.asset(
                                      "assets/loading.json"));
                            },
                          );
                  })),
          SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);
    path.lineTo(size.width - 20, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
