part of 'pages.dart';

class CheckOutPage extends StatefulWidget {
  String idorder;
  String start;
  String to;
  String bus;
  String date;
  String time;
  String seat;
  int price;

  CheckOutPage(this.idorder, this.start, this.to, this.bus, this.date,
      this.time, this.seat, this.price);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  int balance = 0;

  bool check = false;

  SharePreferencesHelper pref = SharePreferencesHelper();

  getWallet() async {
    balance = await pref.getWallet();
    return balance;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getWallet();
    if (balance < widget.price) {
      check = !check;
    }
  }

  @override
  Widget build(BuildContext context) {
    ProgressDialog pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');
    var busProvider = Provider.of<BusProvider>(context);
    return FutureBuilder(
        future: pref.getUsername(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            return Scaffold(
              body: ListView(
                children: [
                  SafeArea(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 40, 40, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                          "assets/actionbar_title.png"))),
                            ),
                          ),
                          Text("Checkout",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(widget.start,
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
                        child: Text(widget.to,
                            style: GoogleFonts.raleway(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 2,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
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
                                "ID Order",
                                style: GoogleFonts.raleway(
                                    fontSize: 16, color: Colors.grey),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                "Bus",
                                style: GoogleFonts.raleway(
                                    fontSize: 16, color: Colors.grey),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                "Date & Time",
                                style: GoogleFonts.raleway(
                                    fontSize: 16, color: Colors.grey),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                "Seat Number",
                                style: GoogleFonts.raleway(
                                    fontSize: 16, color: Colors.grey),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                "Seat",
                                style: GoogleFonts.raleway(
                                    fontSize: 16, color: Colors.grey),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                "Total",
                                style: GoogleFonts.raleway(
                                    fontSize: 16, color: Colors.grey),
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
                                widget.idorder,
                                style: GoogleFonts.openSans(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                widget.bus,
                                style: GoogleFonts.raleway(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                widget.date + " & " + widget.time,
                                style: GoogleFonts.openSans(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                widget.seat,
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
                                        .format(widget.price) +
                                    " x 1",
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
                                    .format(widget.price),
                                style: GoogleFonts.openSans(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 2,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("You Wallet",
                            style: GoogleFonts.openSans(
                                fontSize: 16, color: Colors.black)),
                        FutureBuilder(
                            future: getWallet(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                Color color;
                                if (int.parse(snapshot.data.toString()) >=
                                    widget.price) {
                                  color = Colors.lightBlue;
                                  check = true;
                                } else {
                                  color = Colors.red;
                                  check = false;
                                }
                                return Text(
                                    NumberFormat.currency(
                                            locale: 'id-ID',
                                            symbol: 'Rp. ',
                                            decimalDigits: 0)
                                        .format(snapshot.data),
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: color));
                              } else {
                                return CircularProgressIndicator();
                              }
                            }),
                      ],
                    ),
                  ),
                  FutureBuilder(
                      future: busProvider.getWallet(snap.data.toString()),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (int.parse(snapshot.data) <= widget.price) {
                            print(int.parse(snapshot.data));
                            print("Rp." + widget.price.toString());
                            return Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(30, 30, 30, 10),
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      // onPressed: () {},
                                      child: Text("Checkout Now",
                                          style: GoogleFonts.raleway(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white))),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Get.off(TopUpPage());
                                      },
                                      child: Text("Top Up",
                                          style: GoogleFonts.raleway(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white))),
                                ),
                              ],
                            );
                          } else {
                            return Container(
                              margin: EdgeInsets.all(30),
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    pr.show();

                                    BusProvider.postCheckOut(
                                            "" +
                                                widget.idorder +
                                                "" +
                                                snap.data.toString() +
                                                "" +
                                                widget.seat,
                                            widget.idorder,
                                            snap.data.toString(),
                                            widget.seat,
                                            widget.price.toString())
                                        .then((value) {
                                      print(value);
                                      pref.setWallet(value);
                                      print(pref.getWallet());
                                    });
                                  },
                                  child: Text("Checkout Now",
                                      style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white))),
                            );
                          }
                        } else {
                          return Center(
                            child: Container(
                              height: 100,
                              child: LottieBuilder.asset("assets/loading.json"),
                            ),
                          );
                        }
                      })
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
