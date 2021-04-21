part of 'pages.dart';

class SplashScreen extends StatelessWidget {
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
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
              )),
              Container(
                  child: Text("MUDIAK",
                      style: TextStyle(
                          fontSize: 50, fontWeight: FontWeight.w500))),
            ],
          ),
        ),
      )),
    );
  }
}
