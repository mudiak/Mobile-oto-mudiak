part of 'pages.dart';

class SettingPage extends StatelessWidget {
  SharePreferencesHelper pref = SharePreferencesHelper();
  @override
  Widget build(BuildContext context) {
    var busProvider = Provider.of<BusProvider>(context);

    return Scaffold(
        body: Column(children: [
      SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 40, 40, 10),
          child: Row(
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
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/actionbar_title.png"))),
                  ),
                ),
              ),
              Expanded(
                flex: 15,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      FutureBuilder(
                          future: pref.getPathPicture(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                  margin: EdgeInsets.all(5),
                                  width: 125,
                                  height: 125,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: (snapshot.hasData)
                                            ? NetworkImage(url +
                                                    "" +
                                                    snapshot.data.toString()
                                                // url + "" + pathPicture
                                                )
                                            : AssetImage(
                                                "assets/user_pict.png"),
                                        fit: BoxFit.cover,
                                      )));
                            } else {
                              return Center(
                                child: Container(
                                  height: 100,
                                  child: LottieBuilder.asset(
                                      "assets/loading.json"),
                                ),
                              );
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: FutureBuilder(
                              future: pref.getUsername(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                return FutureBuilder(
                                    future: busProvider.getNama(snapshot.data),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snap) {
                                      if (snap.hasData) {
                                        return Text(
                                          snap.data,
                                          style: GoogleFonts.raleway(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500),
                                        );
                                      } else {
                                        return Center(
                                          child: Container(
                                            height: 50,
                                            child: LottieBuilder.asset(
                                                "assets/loading.json"),
                                          ),
                                        );
                                      }
                                    });
                              })),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: FutureBuilder(
                              future: pref.getUsername(),
                              builder:
                                  (BuildContext context, AsyncSnapshot snap) {
                                if (snap.hasData) {
                                  return Text("Username : " + snap.data,
                                      style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey));
                                } else {
                                  return Text(
                                    "--",
                                    style: GoogleFonts.raleway(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  );
                                }
                              })),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
          flex: 8,
          child: Container(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.off(ProfilePage());
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                height: 35,
                                child: Image.asset("assets/user_pict.png"),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text("Setting Profile",
                                  style: GoogleFonts.raleway(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(5),
                          child: DottedLine(
                            dashColor: "E4E4E4".toColor(),
                            lineThickness: 2.5,
                          )),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(GantiPasswordPage());
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 35,
                              child: Image.asset("assets/key.png"),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text("Ganti Password",
                                style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(5),
                            child: DottedLine(
                              dashColor: "E4E4E4".toColor(),
                              lineThickness: 2.5,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    pref.logout();
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 35,
                              child: Image.asset("assets/logout.png"),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text("Sign Out",
                                style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(5),
                            child: DottedLine(
                              dashColor: "E4E4E4".toColor(),
                              lineThickness: 2.5,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ))
    ]));
  }
}
