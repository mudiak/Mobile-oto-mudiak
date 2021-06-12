part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  EditModel editModel = null;
  SharePreferencesHelper pref = SharePreferencesHelper();
  TextEditingController emailController = TextEditingController();
  String email;
  TextEditingController fullNameController = TextEditingController();
  String username;
  File uploadimage; //variable for choosed file

  Future<void> chooseImage() async {
    var choosedimage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      // Do something with the file
      if (choosedimage == null) {
        // File is null, probably not found or incorrect path.
        return;
      }
      if (choosedimage.path == null) {}
      uploadimage = File(choosedimage.path);
    });
  }

  Future<void> uploadImage(
      String id_customer, String name, String email) async {
    try {
      List<int> imageBytes = uploadimage.readAsBytesSync();
      String baseimage = base64Encode(imageBytes);
      //convert file image to Base64 encoding
      EditModel.postWithFoto(name, id_customer, email, baseimage).then((value) {
        editModel = value;
        pref.setEmail(editModel.email);
        pref.setPathPicture(editModel.pathPicture);
        Get.offAll(MainPage());
      });
    } catch (e) {
      print("Error during converting to Base64");
      Get.snackbar("", "",
          backgroundColor: "D9435E".toColor(),
          icon: Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
          titleText: Text(
            "Failed",
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
          messageText: Text(
            "Failed To Post Image",
            style: GoogleFonts.poppins(color: Colors.white),
          ));
      //there is error during converting file image to base64 encoding.
    }
  }

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
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 150,
                        height: 150,
                        child: FutureBuilder(
                            future: pref.getPathPicture(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              print(snapshot.data);
                              return Stack(
                                children: [
                                  Center(
                                    child: ClipOval(
                                      child: Container(
                                          width: 125,
                                          height: 125,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: (uploadimage == null)
                                                    ? (snapshot.hasData)
                                                        ? NetworkImage(url +
                                                                "" +
                                                                snapshot.data
                                                                    .toString()
                                                            // url + "" + pathPicture
                                                            )
                                                        : AssetImage(
                                                            "assets/user_pict.png")
                                                    : FileImage(
                                                        uploadimage,
                                                      ),
                                                fit: BoxFit.cover,
                                              ))),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      chooseImage();
                                    },
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            height: 50,
                                            width: 50,
                                            child: Image(
                                                image: AssetImage((uploadimage ==
                                                        null)
                                                    ? "assets/btn_add_photo.png"
                                                    : "assets/btn_remove_photo.png")))),
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: FutureBuilder(
                            future: pref.getUsername(),
                            builder:
                                (BuildContext context, AsyncSnapshot snap) {
                              username = snap.data;
                              return Text("Username : " + snap.data,
                                  style: GoogleFonts.raleway(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black45));
                            })),
                  ],
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
                  padding: EdgeInsets.fromLTRB(5, 10, 20, 0),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 50,
                                child: Image.asset("assets/mail.png"),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                child: FutureBuilder(
                                    future: pref.getEmail(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      return TextField(
                                        controller: emailController
                                          ..text = snapshot.data,
                                        onChanged: (text) => email = text,
                                        decoration: InputDecoration(
                                          labelText: "Email Address",
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide:
                                                BorderSide(color: Colors.blue),
                                          ),
                                          hintText: "Please Enter Email",
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ],
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
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.fromLTRB(5, 10, 20, 0),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 50,
                                child: Image.asset("assets/user_pict.png"),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                child: FutureBuilder(
                                    future: pref.getUsername(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      return FutureBuilder(
                                          future: busProvider
                                              .getNama(snapshot.data),
                                          builder: (BuildContext context,
                                              AsyncSnapshot snap) {
                                            return TextField(
                                              controller: fullNameController
                                                ..text = snap.data,
                                              decoration: InputDecoration(
                                                labelText: "Full Name",
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                      color: Colors.blue),
                                                ),
                                                hintText:
                                                    "Please Enter Full Name",
                                              ),
                                            );
                                          });
                                    }),
                              ),
                            ),
                          ],
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
                Container(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 40, 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: RaisedButton(
                          onPressed: () {
                            (uploadimage == null)
                                // print(fullNameController.text);
                                // print(emailController.text);
                                // print(username.toString());
                                // ? print("notfoto")
                                // : print("foto");
                                ? EditModel.postWithoutFoto(
                                        fullNameController.text,
                                        username,
                                        emailController.text)
                                    .then((value) {
                                    editModel = value;
                                    pref.setEmail(editModel.email);
                                    pref.setPathPicture(editModel.pathPicture);
                                    Get.offAll(MainPage());
                                  })
                                : uploadImage(username, fullNameController.text,
                                    emailController.text);
                          },
                          color: Colors.amber,
                          child: Text(
                            "Save Changes",
                            style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
    ]));
  }
}
