part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RegisterModel registesModel = null;

  bool load = false;

  File uploadimage; //variable for choosed file

  Future<void> chooseImage() async {
    var choosedimage = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
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
      String id_customer, String name, String email, String password) async {
    //show your own loading or progressing code here

    Uri uploadurl = Uri.parse(url + "register.php?aksi=uploadpict");
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    try {
      List<int> imageBytes = uploadimage.readAsBytesSync();
      String baseimage = base64Encode(imageBytes);
      //convert file image to Base64 encoding
      var response = await http.post(uploadurl, body: {
        'name': name,
        'image': baseimage,
      });
      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body); //decode json data
        if (jsondata["error"]) {
          //check error sent from server
          print(jsondata["msg"]);
          //if error return from server, show message from server
        } else {
          setState(() {
            print("Upload successful");
            RegisterModel.connectToAPI(id_customer, name, email, password)
                .then((value) {
              registesModel = value;
              if (registesModel.kode == 1) {
                Get.offAll(SignInPage());

                Get.snackbar("", "",
                    backgroundColor: "2D9CDB".toColor(),
                    icon: Icon(
                      Icons.check_circle_sharp,
                      color: Colors.white,
                    ),
                    titleText: Text(
                      "Sign Up Success",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    messageText: Text(
                      "Please login to order tickets",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ));
              } else {
                load = false;
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
                      "Failed to Register",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ));
              }
            });
          });
        }
      } else {
        print("Error during connection to server");
        //there is error during connecting to server,
        //status code might be 404 = url not found
      }
    } catch (e) {
      print("Error during converting to Base64");
      //there is error during converting file image to base64 encoding.
    }
  }

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    ProgressDialog pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');
    if (pr.hide() == true) {
      Get.back();
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                height: 100,
                child: Stack(
                  children: [
                    Row(
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
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(" Create New\nYour Account",
                                style: GoogleFonts.raleway(
                                    fontSize: 25, fontWeight: FontWeight.w500)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/user_pict.png"))),
                  child: Stack(
                    children: [
                      Center(
                        child: (uploadimage == null)
                            ? SizedBox()
                            : ClipOval(
                                child: Container(
                                    width: 100,
                                    height: 100,
                                    child: Image.file(
                                      uploadimage,
                                      fit: BoxFit.cover,
                                    ))),
                      ),
                      GestureDetector(
                        onTap: () {
                          chooseImage();
                        },
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                                height: 35,
                                width: 35,
                                child: Image(
                                    image: AssetImage((uploadimage == null)
                                        ? "assets/btn_add_photo.png"
                                        : "assets/btn_remove_photo.png")))),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                width: double.infinity,
                height: 2,
                color: "C4C4C4".toColor()),
            Expanded(
              flex: 10,
              child: ListView(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        hintText: "Please Enter Email",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        hintText: "Please Enter Your Username",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        hintText: "Please Enter Your Name",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      controller: passwordController,
                      obscureText: _isObscure,
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
                          labelText: 'Password',
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
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
                      controller: confirmPasswordController,
                      obscureText: _isObscure,
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
                          labelText: 'Confirmasi Password',
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              })),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pr.show();
                        print(load);
                        if (usernameController.text == "" ||
                            fullNameController.text == "" ||
                            emailController.text == "" ||
                            passwordController.text == "" ||
                            confirmPasswordController.text == "") {
                          setState(() {
                            pr.hide();
                            load = false;
                          });
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
                                style: GoogleFonts.poppins(color: Colors.white),
                              ));
                        } else {
                          setState(() {
                            load = false;
                            pr.hide();
                          });
                          if (passwordController.text !=
                              confirmPasswordController.text) {
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
                                  "Password with Confirm Password is not valid",
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ));
                          } else if (uploadimage == null) {
                            pr.hide();

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
                                  "Picture is Empty",
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ));
                            Get.back();
                          } else {
                            pr.hide();

                            uploadImage(
                                usernameController.text,
                                fullNameController.text,
                                emailController.text,
                                passwordController.text);
                          }
                        }
                      });
                    },
                    child: (load == false)
                        ? Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/button_primary_circle.png"))),
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            child: Center(
                                child:
                                    LottieBuilder.asset("assets/loading.json")),
                          ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Text("Sign In",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blue)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
