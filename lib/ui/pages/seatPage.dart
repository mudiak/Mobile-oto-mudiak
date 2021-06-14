part of 'pages.dart';

class SeatPage extends StatefulWidget {
  final String idorder;
  final String from;
  final String to;
  final String bus;
  final String time;
  final String date;
  final int price;
  SeatPage(this.idorder, this.from, this.to, this.bus, this.time, this.date,
      this.price);
  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  // var tgl = new DateTime.now();
  bool choise = false;
  String seatChoise = null;

  List<String> seatpakai = ["SP"];
  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      seatChoise = null;
    });
    // RefreshIndicator
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    var busProvider = Provider.of<BusProvider>(context);
    return RefreshIndicator(
        child: Scaffold(
          backgroundColor: Colors.lightBlue,
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                margin: EdgeInsets.only(right: 26),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/actionbar_title_white.png"))),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Choose your",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white)),
                            Text("Seat",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Stack(
                  children: [
                    FutureBuilder(
                        future: busProvider.getListSeat(widget.idorder),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            List<Seat> data = snapshot.data;
                            seatpakai = data.map((e) => e.seat).toList();
                            print(seatpakai);
                            // print(seatpakai);
                            // print("jdsfhskjdhfkjsd" + data.toString());
                            // print(seatpakai.contains("A1"));
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Colors.white),
                              child: ListView(
                                children: [
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("From :",
                                                style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.grey)),
                                            Text(widget.from,
                                                style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Colors.lightBlue)),
                                            Container(
                                              height: 3,
                                              width: widget.from.length
                                                      .toDouble() *
                                                  8,
                                              color: Colors.lightBlue,
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("To :",
                                                style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.grey)),
                                            Text(widget.to,
                                                style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Colors.lightBlue)),
                                            Container(
                                              height: 3,
                                              width:
                                                  widget.to.length.toDouble() *
                                                      8,
                                              color: Colors.lightBlue,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    height: 30,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/frontbus.png"))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(80, 10, 80, 10),
                                    height: 400,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("A1"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "A1";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "A1"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "A1")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("A1")),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("A2"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "A2";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "A2"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "A2")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("A2")),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 1,
                                                          child: Container()),
                                                      Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    5),
                                                            decoration:
                                                                BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                8),
                                                                    color: (seatpakai.contains(
                                                                            "SP"))
                                                                        ? "2D9CDB"
                                                                            .toColor()
                                                                        : (seatChoise ==
                                                                                "SP")
                                                                            ? "2D9CDB".toColor()
                                                                            : "2D9CDB".toColor()),
                                                            child: Center(
                                                                child: Text(
                                                              "SP",
                                                              style: GoogleFonts.raleway(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                          )),
                                                      Expanded(
                                                          flex: 1,
                                                          child: Container()),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("B1"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "B1";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "B1"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "B1")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("B1")),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1, child: Container()),
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("B2"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "B2";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "B2"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "B2")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("B2")),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("B3"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "B3";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "B3"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "B3")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("B3")),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1, child: Container()),
                                              Expanded(
                                                  flex: 1, child: Container()),
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("C1"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "C1";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "C1"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "C1")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("C1")),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("C2"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "C2";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "C2"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "C2")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("C2")),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("D1"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "D1";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "D1"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "D1")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("D1")),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1, child: Container()),
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("D2"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "D2";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "D2"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "D2")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("D2")),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("D3"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "D3";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "D3"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "D3")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("D3")),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("E1"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "E1";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "E1"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "E1")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("E1")),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1, child: Container()),
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("E2"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "E2";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "E2"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "E2")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("E2")),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("E3"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "E3";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "E3"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "E3")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("E3")),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("F1"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "F1";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "F1"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "F1")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("F1")),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("F2"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "F2";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "F2"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "F2")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("F2")),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("F3"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "F3";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "F3"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "F3")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("F3")),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      (seatpakai.contains("F4"))
                                                          ? setState(() {})
                                                          : setState(() {
                                                              seatChoise = "F4";
                                                            });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: (seatpakai
                                                                  .contains(
                                                                      "F4"))
                                                              ? "D3CDCD"
                                                                  .toColor()
                                                              : (seatChoise ==
                                                                      "F4")
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .white),
                                                      child: Center(
                                                          child: Text("F4")),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Center(
                              child: Container(
                                height: 100,
                                child:
                                    LottieBuilder.asset("assets/loading.json"),
                              ),
                            );
                          }
                        }),
                    (seatChoise != null)
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 60,
                              width: 60,
                              margin: EdgeInsets.only(bottom: 20),
                              child: FloatingActionButton(
                                onPressed: () {
                                  Get.to(CheckOutPage(
                                      widget.idorder,
                                      widget.from,
                                      widget.to,
                                      widget.bus,
                                      widget.date,
                                      widget.time,
                                      seatChoise,
                                      widget.price));
                                },
                                elevation: 0,
                                backgroundColor: "FBD460".toColor(),
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/button_primary_circle.png")),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 0.5,
                                      offset: Offset(1, 1), // Shadow position
                                    )
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Available",
                                  style:
                                      GoogleFonts.raleway(color: Colors.grey))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 0.5,
                                      offset: Offset(1, 1), // Shadow position
                                    )
                                  ],
                                  color: "E5E5E5".toColor(),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Booked",
                                  style:
                                      GoogleFonts.raleway(color: Colors.grey))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 0.5,
                                      offset: Offset(1, 1), // Shadow position
                                    )
                                  ],
                                  color: "FBD460".toColor(),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Selected",
                                  style:
                                      GoogleFonts.raleway(color: Colors.grey))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 0.5,
                                      offset: Offset(1, 1), // Shadow position
                                    )
                                  ],
                                  color: "2D9CDB".toColor(),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Driver",
                                style: GoogleFonts.raleway(color: Colors.grey),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
        onRefresh: refresh);
  }
}
