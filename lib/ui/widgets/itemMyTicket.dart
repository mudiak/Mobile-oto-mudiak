part of 'widgets.dart';

class ItemMyTicket extends StatefulWidget {
  @override
  _ItemMyTicketState createState() => _ItemMyTicketState();
}

class _ItemMyTicketState extends State<ItemMyTicket> {
  @override
  Widget build(BuildContext context) {
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
              offset: Offset(1, 1), // Shadow position
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: 50,
              child: Image.asset("assets/location.png"),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sinamar",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15)),
                        Row(
                          children: [
                            Text("From :",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w400,
                                    color: "A4A4A4".toColor(),
                                    fontSize: 15)),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Limbanang",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    color: "A4A4A4".toColor(),
                                    fontSize: 15)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("To :",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w400,
                                    color: "A4A4A4".toColor(),
                                    fontSize: 15)),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Padang",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    color: "A4A4A4".toColor(),
                                    fontSize: 15)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sat 21, 06:00 ",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                color: "A4A4A4".toColor(),
                                fontSize: 15)),
                        Text("#22081996",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                color: "A4A4A4".toColor(),
                                fontSize: 15)),
                        Text("Rp. 100.000",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                color: "A4A4A4".toColor(),
                                fontSize: 15)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
