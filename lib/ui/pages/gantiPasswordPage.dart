part of 'pages.dart';

class GantiPasswordPage extends StatefulWidget {
  @override
  _GantiPasswordPageState createState() => _GantiPasswordPageState();
}

class _GantiPasswordPageState extends State<GantiPasswordPage> {
  SharePreferencesHelper pref = SharePreferencesHelper();
  bool _IsPasswordOld = true;

  bool _IsPasswordNew = true;

  bool _IsConfirmPasswordNew = true;
  String username = "";
  bool load = false;

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  GantiPassword gantiPassword = null;
  @override
  Widget build(BuildContext context) {
    ProgressDialog pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');
    return FutureBuilder(
        future: pref.getUsername(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            username = snapshot.data;
            print(username);
            return Scaffold(
              body: Column(
                children: [
                  SafeArea(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 40, 40, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
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
                                          "assets/actionbar_title.png"))),
                            ),
                          ),
                          Text("Ganti Password",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: DottedLine(
                        dashColor: "E4E4E4".toColor(),
                        lineThickness: 2.5,
                      )),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextField(
                            controller: oldPasswordController,
                            obscureText: _IsPasswordOld,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                hintText: "***",
                                labelText: 'Old Password',
                                suffixIcon: IconButton(
                                    icon: Icon(!_IsPasswordOld
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _IsPasswordOld = !_IsPasswordOld;
                                        _IsPasswordNew = true;
                                        _IsConfirmPasswordNew = true;
                                      });
                                    })),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextField(
                            controller: newPasswordController,
                            obscureText: _IsPasswordNew,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                hintText: "***",
                                labelText: 'New Password',
                                suffixIcon: IconButton(
                                    icon: Icon(!_IsPasswordNew
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _IsPasswordNew = !_IsPasswordNew;
                                        _IsPasswordOld = true;
                                        _IsConfirmPasswordNew = true;
                                      });
                                    })),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextField(
                            controller: confirmNewPasswordController,
                            obscureText: _IsConfirmPasswordNew,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                hintText: "***",
                                labelText: 'Confirmasi New Password',
                                suffixIcon: IconButton(
                                    icon: Icon(!_IsConfirmPasswordNew
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _IsConfirmPasswordNew =
                                            !_IsConfirmPasswordNew;
                                        _IsPasswordNew = true;
                                        _IsPasswordOld = true;
                                      });
                                    })),
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                            child: DottedLine(
                              dashColor: "E4E4E4".toColor(),
                              lineThickness: 2.5,
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            pr.show();
                            if (oldPasswordController.text == "" ||
                                newPasswordController.text == "" ||
                                confirmNewPasswordController.text == "") {
                              Get.snackbar("", "",
                                  backgroundColor: "F6C30E".toColor(),
                                  icon: Icon(
                                    Icons.info_rounded,
                                    color: Colors.white,
                                  ),
                                  titleText: Text(
                                    "Warning",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  messageText: Text(
                                    "Field Cannot Be Empty",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ));
                              Future.delayed(Duration(seconds: 3))
                                  .then((value) {
                                pr.hide();
                              });
                            } else if (confirmNewPasswordController.text !=
                                newPasswordController.text) {
                              Get.snackbar("", "",
                                  backgroundColor: "F6C30E".toColor(),
                                  icon: Icon(
                                    Icons.info_rounded,
                                    color: Colors.white,
                                  ),
                                  titleText: Text(
                                    "Warning",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  messageText: Text(
                                    "New Password with Confirm Password is not valid",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ));
                              Future.delayed(Duration(seconds: 3))
                                  .then((value) {
                                pr.hide();
                              });
                            } else {
                              GantiPassword.connectToAPI(
                                      username,
                                      oldPasswordController.text,
                                      newPasswordController.text)
                                  .then((value) {
                                gantiPassword = value;

                                if (gantiPassword.kode == 1) {
                                  pref.logout();
                                  Get.snackbar("", "",
                                      backgroundColor: "2D9CDB".toColor(),
                                      icon: Icon(
                                        Icons.check_circle_sharp,
                                        color: Colors.white,
                                      ),
                                      titleText: Text(
                                        "Change Password Success",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      messageText: Text(
                                        gantiPassword.response,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ));
                                } else if (gantiPassword.kode == 101) {
                                  Get.snackbar("", "",
                                      backgroundColor: "D9435E".toColor(),
                                      icon: Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                      ),
                                      titleText: Text(
                                        "Failed",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      messageText: Text(
                                        gantiPassword.response,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ));
                                  Future.delayed(Duration(seconds: 3))
                                      .then((value) {
                                    pr.hide();
                                  });
                                }
                              });
                            }
                          },
                          child: Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/button_primary_circle.png"))),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container(
              height: 100,
              width: 100,
              child: Center(child: LottieBuilder.asset("assets/loading.json")),
            );
          }
        });
  }
}
