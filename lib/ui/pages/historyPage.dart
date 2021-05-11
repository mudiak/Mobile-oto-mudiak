part of 'pages.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool isExpriredTicket = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(),
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
                                    color: !isExpriredTicket
                                        ? Colors.white
                                        : "C4C4C4".toColor(),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
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
                                        ? Colors.white
                                        : "C4C4C4".toColor(),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
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
          ))
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
