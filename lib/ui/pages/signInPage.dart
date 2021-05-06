part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: "F6F7F9".toColor(),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 1 / 3,
                    height: 130,
                    child: Center(
                        child: LottieBuilder.asset("assets/signin.json"))),
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Welcome To",
                              style: TextStyle(fontSize: 30),
                            )),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text("OTO Mudiak",
                                style: TextStyle(fontSize: 30))),
                      ],
                    ))
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
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
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
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
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              "Forgot Password?",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            Text("Get Now",
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue))
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(MainPage()),
                    child: Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/button_primary_circle.png"))),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Start fresh now?",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(SignUpPage()),
                          child: Text("Sign Up",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blue)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
