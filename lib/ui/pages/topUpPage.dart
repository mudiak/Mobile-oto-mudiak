part of 'pages.dart';

class TopUpPage extends StatefulWidget {
  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  List<int> item = [
    40000,
    50000,
    100000,
    200000,
    500000,
    1000000,
  ];

  int topWallet = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SafeArea(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 40, 40, 20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Row(
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
                                        image: AssetImage(
                                            "assets/actionbar_title_white.png"))),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Center(
                              child: Text("Top Up",
                                  style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                      color: Colors.white)),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                                height: 100,
                                child: Center(
                                    child: LottieBuilder.asset(
                                        "assets/wallet.json"))),
                          )
                        ],
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Mau Top Up Berapa ?",
                        style: GoogleFonts.raleway(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ))
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: "F6F7F9".toColor()),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: item.map((data) {
                                return InkWell(
                                  onTap: () {
                                    topWallet = data;
                                    setState(() {});
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(20, 5, 20, 10),
                                        width: double.infinity,
                                        height: 75,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: Offset(1, 3),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                        child: Center(
                                            child: Text(
                                                NumberFormat.currency(
                                                        locale: 'id-ID',
                                                        symbol: 'Rp. ',
                                                        decimalDigits: 0)
                                                    .format(data),
                                                style: GoogleFonts.openSans(
                                                    fontSize: 20,
                                                    color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.7),
                                                  spreadRadius: 2,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 1),
                                                )
                                              ],
                                            ),
                                            height: 50,
                                            child: Image.asset((topWallet ==
                                                    data)
                                                ? "assets/pilih.png"
                                                : "assets/btn_belumpilih.png"),
                                          ))
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 200,
                        )
                      ],
                    ),
                  ),
                  (topWallet != 0)
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 20,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white),
                                    height: 75,
                                    margin: EdgeInsets.fromLTRB(20, 20, 0, 30),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 10, 0, 0),
                                                child: Text(
                                                  "Total Harga",
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 16,
                                                      color: Colors.grey),
                                                )),
                                            Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 5, 0, 0),
                                                child: Text(
                                                  NumberFormat.currency(
                                                          locale: 'id-ID',
                                                          symbol: 'Rp. ',
                                                          decimalDigits: 0)
                                                      .format(topWallet),
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.lightBlue),
                                                )),
                                          ],
                                        ),
                                        Container(
                                            height: 200,
                                            child: LottieBuilder.asset(
                                                "assets/shop.json")),
                                      ],
                                    )),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return DialogPopUp(
                                              topWallet.toString());
                                        });
                                  },
                                  child: Container(
                                      height: 65,
                                      // color: Colors.red,
                                      margin:
                                          EdgeInsets.fromLTRB(0, 20, 20, 30),
                                      child: Center(
                                        child: Image.asset(
                                            "assets/button_primary_circle.png"),
                                      )),
                                ),
                              ),
                            ],
                          ))
                      : SizedBox(),
                ],
              ),
            ),
          ],
        )));
  }
}
