part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Get.offAll(SignInPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.lightBlue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Text(
                "OTO",
                style: GoogleFonts.calistoga(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
              Container(
                  child: Text("MUDIAK",
                      style: GoogleFonts.calistoga(
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Colors.white))),
            ],
          ),
        ),
      )),
    );
  }
}
