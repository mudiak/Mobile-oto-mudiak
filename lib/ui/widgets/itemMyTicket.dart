part of 'widgets.dart';

class ItemMyTicket extends StatefulWidget {
  final Ticket ticket;
  bool exprired;
  ItemMyTicket(this.ticket, this.exprired);
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
                        Text(widget.ticket.nama,
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
                            Text(widget.ticket.start,
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
                            Text(widget.ticket.finish,
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
                        Text(
                            widget.ticket.date +
                                ", " +
                                widget.ticket.time.substring(0, 5),
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                color: "A4A4A4".toColor(),
                                fontSize: 15)),
                        (widget.exprired == false)
                            ? Text(
                                "#" + widget.ticket.id,
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w400,
                                  color: "A4A4A4".toColor(),
                                  fontSize: 15,
                                ),
                              )
                            : Text(
                                "#" + widget.ticket.id,
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w400,
                                    color: "A4A4A4".toColor(),
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough),
                              ),
                        Text(
                            NumberFormat.currency(
                                    locale: 'id-ID',
                                    symbol: 'Rp. ',
                                    decimalDigits: 0)
                                .format(widget.ticket.price),
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
