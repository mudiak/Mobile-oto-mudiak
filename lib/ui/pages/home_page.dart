part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nama;

  String pathPicture = "jsjs";

  int balance = 0;

  SharePreferencesHelper pref = SharePreferencesHelper();

  getName() async {
    nama = await pref.getUsername();
    return nama;
  }

  getPathPicture() async {
    pathPicture = await pref.getPathPicture();
    return pathPicture;
  }

  getWallet() async {
    balance = await pref.getWallet();
    return balance;
  }

  @override
  Widget build(BuildContext context) {
    var busProvider = Provider.of<BusProvider>(context);
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
                              border:
                                  Border.all(color: Colors.white, width: 2.5),
                            ),
                            child: FutureBuilder(
                                future: getPathPicture(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  {
                                    return Container(
                                      margin: EdgeInsets.all(5),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage((snapshot
                                                    .hasData)
                                                ? url +
                                                    "" +
                                                    snapshot.data.toString()
                                                // url + "" + pathPicture
                                                : "https://www.profilepicture7.com//bao/bao_haokan/1/1634803414.jpg"),
                                            fit: BoxFit.cover,
                                          )),
                                    );
                                  }
                                }))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 5, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                            future: getName(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return FutureBuilder(
                                    future: busProvider.getNama(nama),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      return Text(
                                        snapshot.data.toString(),
                                        style: GoogleFonts.raleway(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      );
                                    });
                              } else {
                                return CircularProgressIndicator();
                              }
                            }),
                        SizedBox(
                          height: 6,
                        ),
                        (nama != null)
                            ? FutureBuilder(
                                future: busProvider.getWallet(nama),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  pref.setWallet(
                                      int.parse(snapshot.data.toString()));
                                  if (snapshot.hasData) {
                                    balance =
                                        int.parse(snapshot.data.toString());
                                    return Text(
                                      "IDR " + balance.toString(),
                                      style: GoogleFonts.raleway(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                })
                            : FutureBuilder(
                                future: getWallet(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    balance =
                                        int.parse(snapshot.data.toString());
                                    return Text(
                                      "IDR " + balance.toString(),
                                      style: GoogleFonts.raleway(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                })
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
          child: FutureBuilder(
            future: busProvider.getListBus(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String kode = "";

                List<Bus> data = snapshot.data;
                data.map((e) => kode = e.idbus).toList();
                print(kode);
                if (kode == null) {
                  return Container(
                    height: 100,
                    width: 100,
                    child: Center(
                        child: LottieBuilder.asset("assets/loading.json")),
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
                              Get.to(SeatPage(
                                  item.idbus,
                                  item.start,
                                  item.finish,
                                  item.nama,
                                  (item.time).substring(0, 5),
                                  item.date,
                                  item.price));
                            },
                            child: ItemTicket(item)),
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
          ),
        ),
        SizedBox(
          height: 70,
        )
      ],
    );
  }
}
