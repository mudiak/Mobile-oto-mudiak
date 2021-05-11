part of 'widgets.dart';

class ItemTicket extends StatelessWidget {
  String company;
  String from;
  String goal;
  String berangkat;
  int secondlama;
  double price;

  ItemTicket(
      {this.company,
      this.from,
      this.goal,
      this.berangkat,
      this.price,
      this.secondlama});
  @override
  Widget build(BuildContext context) {
    int jum = goal.length;
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      height: 100,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 0.5,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 50,
                  child: Image.asset("assets/location.png"),
                ),
                Container(
                    margin: EdgeInsets.all(5),
                    child: DottedLine(
                      direction: Axis.vertical,
                      dashColor: "E4E4E4".toColor(),
                      lineThickness: 2.5,
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text("Sinamar",
                            style: GoogleFonts.raleway(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        children: [
                          Text("Limbanang",
                              style: GoogleFonts.raleway(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                          Center(
                            child: Container(
                                width: MediaQuery.of(context).size.width / 4,
                                margin: EdgeInsets.all(5),
                                child: DottedLine(
                                  dashColor: "FBD460".toColor(),
                                  lineThickness: 2.5,
                                )),
                          ),
                          Text(
                              (jum > 11)
                                  ? "" + goal.substring(0, 11) + "...."
                                  : goal,
                              style: GoogleFonts.raleway(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Text("06:00",
                                  style: GoogleFonts.raleway(
                                      color: "A4A4A4".toColor(),
                                      fontWeight: FontWeight.w600))),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(MdiIcons.timerOutline),
                          ),
                          Text("3h 20m",
                              style: GoogleFonts.raleway(
                                  color: "A4A4A4".toColor(),
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text("RP. 1.135.000",
                                    style: GoogleFonts.raleway(
                                        color: "A4A4A4".toColor(),
                                        fontWeight: FontWeight.w600))),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class ItemClipperatas extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     path.lineTo(size.width / 5 - 20, 0);
//     path.quadraticBezierTo(size.width / 5 - 20, 20, size.width / 5, 20);
//     path.quadraticBezierTo(size.width / 5 + 20, 20, size.width / 5 + 20, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);

//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }

// class ItemClipperbawah extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height);
//     path.lineTo(size.width / 5 - 20, size.height);
//     // path.quadraticBezierTo(
//     //     size.width / 5, size.height / 3, size.width / 5, size.height);
//     path.quadraticBezierTo(size.width / 5, 40, size.width / 5, 0);
//     // path.quadraticBezierTo(size.width / 5, size.height, size.width / 5, 0);
//     path.quadraticBezierTo(
//         size.width / 5, 20, size.width / 5 + 20, size.height);
//     // path.lineTo(size.width / 5 + 20, size.height * 0.75);
//     // path.quadraticBezierTo(size.width / 5 + 20, 20, size.width / 5 + 20, 0);
//     // path.quadraticBezierTo(
//     //   20,
//     //   size.height / 5 - 20,
//     //   20,
//     //   size.height / 5,
//     // );
//     // // path.quadraticBezierTo(20, size.width / 5 + 20, 0, size.width / 5 + 20);
//     // path.lineTo(0, size.width);

//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     // path.lineTo(size.height, 0);

//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
