part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
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
                        margin: EdgeInsets.fromLTRB(40, 0, 20, 0),
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
            SizedBox(
              height: 14,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/user_pict.png"))),
              ),
            ),
            SizedBox(
              height: 35,
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
              height: 14,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: TextField(
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
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/button_primary_circle.png"))),
            ),
          ],
        ),
      ),
    );
  }
}
