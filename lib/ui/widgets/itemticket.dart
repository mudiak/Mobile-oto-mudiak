part of 'widgets.dart';

class ItemTicket extends StatelessWidget {
  final Bus bus;

  ItemTicket(this.bus);
  @override
  Widget build(BuildContext context) {
    String la = "";
    if ((bus.lama.substring(0, 2).substring(0, 1) == "0")) {
      la = "" + bus.lama.substring(1, 2) + "h ";
      if ((bus.lama.substring(3, 5).substring(0, 1) == "0")) {
        la = la + " " + (bus.lama.substring(4, 5)).substring(0, 1) + "m";
      } else {
        la = la + " " + (bus.lama.substring(3, 5)).substring(0, 2) + "m";
      }
    } else {
      la = "" + bus.lama.substring(0, 2) + "h ";
      if ((bus.lama.substring(3, 5).substring(0, 1) == "0")) {
        la = la + " " + (bus.lama.substring(4, 5)).substring(0, 1) + "m";
      } else {
        la = la + " " + (bus.lama.substring(3, 5)).substring(0, 2) + "m";
      }
    }
    int jum = bus.finish.length;
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      height: 100,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 0.5,
              offset: Offset(0, 1), // Shadow position
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
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text(bus.nama,
                              style: GoogleFonts.raleway(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(bus.start,
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
                                    ? "" + bus.finish.substring(0, 11) + "...."
                                    : bus.finish,
                                style: GoogleFonts.raleway(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text((bus.time).substring(0, 5),
                                        style: GoogleFonts.raleway(
                                            color: "A4A4A4".toColor(),
                                            fontWeight: FontWeight.w600))),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(MdiIcons.timerOutline),
                                ),
                                Text(la,
                                    style: GoogleFonts.raleway(
                                        color: "A4A4A4".toColor(),
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Container(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      NumberFormat.currency(
                                              locale: 'id-ID',
                                              symbol: 'Rp. ',
                                              decimalDigits: 0)
                                          .format(bus.price),
                                      style: GoogleFonts.raleway(
                                          color: "A4A4A4".toColor(),
                                          fontWeight: FontWeight.w600))),
                            )
                          ],
                        )
                      ],
                    ),
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
