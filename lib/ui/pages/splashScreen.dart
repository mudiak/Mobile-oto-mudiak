part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharePreferencesHelper pref = SharePreferencesHelper();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Future<String> authToken = pref.getEmail();
      authToken.then((data) {
        if (data == null) {
          Get.offAll(SignInPage());
        } else {
          Get.offAll(MainPage());
        }
      }, onError: (e) {
        print(e);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: "2D9CDB".toColor(),
        child: Center(child: Image.asset("assets/profil.png")),
      )),
    );
  }
}
