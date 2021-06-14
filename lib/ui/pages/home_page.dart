part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nama = "--";

  String pathPicture = "jsjs";

  int balance = 0;
  int jum = 0;
  String lokasi;

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

  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 1));
    String username = await pref.getUsername();

    setState(() {
      getName();
      getPathPicture();
      pref.setWallet(username);
      lokasi = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var busProvider = Provider.of<BusProvider>(context);
    return RefreshIndicator(
        child: Column(
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
                            Center(
                              child: Container(
                                  height: 100,
                                  child: Center(
                                      child: LottieBuilder.asset(
                                          "assets/borderprofile.json"))),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 7),
                                child: FutureBuilder(
                                    future: getPathPicture(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        return Center(
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(SettingPage());
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(5),
                                              width: 75,
                                              height: 75,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: (snapshot.hasData)
                                                        ? NetworkImage(url +
                                                                "" +
                                                                snapshot.data
                                                                    .toString()
                                                            // url + "" + pathPicture
                                                            )
                                                        : AssetImage(
                                                            "assets/user_pict.png"),
                                                    fit: BoxFit.cover,
                                                  )),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          margin: EdgeInsets.all(5),
                                          height: 75,
                                          width: 75,
                                          child: Image.asset(
                                              "assets/user_pict.png"),
                                        );
                                      }
                                    }),
                              ),
                            ),
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
                                future: pref.getName(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.data != null) {
                                    jum = snapshot.data.length;

                                    return Text(
                                      (jum > 18)
                                          ? snapshot.data.substring(0, 18)
                                          : snapshot.data.toString(),
                                      style: GoogleFonts.raleway(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                }),
                            SizedBox(
                              height: 6,
                            ),
                            FutureBuilder(
                                future: getWallet(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    balance =
                                        int.parse(snapshot.data.toString());
                                    return Text(
                                      NumberFormat.currency(
                                              locale: 'id-ID',
                                              symbol: 'Rp. ',
                                              decimalDigits: 0)
                                          .format(balance),
                                      style: GoogleFonts.openSans(
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
                child: FutureBuilder(
                    future: busProvider.getListLokasi(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      List<Lokasi> data = snapshot.data;
                      return DropdownSearch<String>(
                        mode: Mode.MENU,
                        popupBarrierColor: Colors.grey,
                        showSelectedItem: true,
                        items: ['Limbanang', 'Padang', 'Pekanbaru'],
                        hint: "country in menu mode",
                        popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: (String s) {
                          lokasi = s;
                          print(s);
                          setState(() {});
                        },
                        selectedItem: "Search ",
                      );
                    })),
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
                    suffixIcon: GestureDetector(
                        onTap: () {}, child: Icon(Icons.cancel)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: (lokasi == null)
                    ? busProvider.getListBus()
                    : busProvider.getListBusLokasi(lokasi),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String kode = "";

                    List<Bus> data = snapshot.data;
                    data.map((e) => kode = e.idbus).toList();
                    print(kode);
                    if (kode == null) {
                      return Container(
                        height: 100,
                        width: 200,
                        child: Center(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LottieBuilder.asset("assets/data.json"),
                            Text("Data Is Empty",
                                style: GoogleFonts.raleway(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue))
                          ],
                        )),
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

                  return RefreshIndicator(
                      onRefresh: refresh,
                      child: Center(
                        child: Container(
                          height: 100,
                          child: LottieBuilder.asset("assets/loading.json"),
                        ),
                      ));
                },
              ),
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
        onRefresh: refresh);
  }
}
