part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3 / 1.5,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.lightBlue),
          child: SafeArea(
              child: Center(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.5),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.profilepicture7.com//bao/bao_haokan/1/1634803414.jpg"),
                                  fit: BoxFit.contain,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 5, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hanif Aulia Sabri",
                          style: GoogleFonts.raleway(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "IDR 100.000",
                          style: GoogleFonts.raleway(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          padding: EdgeInsets.all(5),
          height: 50,
          child: DropdownSearch<String>(
            mode: Mode.BOTTOM_SHEET,
            popupBarrierColor: Colors.grey,
            showSelectedItem: true,
            items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
            hint: "country in menu mode",
            popupItemDisabled: (String s) => s.startsWith('I'),
            onChanged: print,
            selectedItem: "Brazil",
          ),
        ),
        Container(
          height: 35,
          margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
          child: Center(
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixIcon:
                    GestureDetector(onTap: () {}, child: Icon(Icons.cancel)),
              ),
            ),
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            Container(
              child: ItemTicket(
                goal: "Padang Panjang",
              ),
            ),
            Container(
              child: ItemTicket(
                goal: "Payakumbuh",
              ),
            ),
            Container(
              child: ItemTicket(
                goal: "BukitTinggi",
              ),
            ),
            Container(
              child: ItemTicket(
                goal: "BukitTinggi",
              ),
            ),
          ],
        )),
        SizedBox(
          height: 70,
        )
      ],
    );
  }
}
