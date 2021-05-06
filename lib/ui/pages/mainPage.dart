part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;

  MainPage({this.initialPage = 0});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: "F6F7F9".toColor(),
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                Center(child: HomePage()),
                Center(
                  child: Text('dsf'),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 46,
                width: 46,
                margin: EdgeInsets.only(bottom: 42),
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: "FBD460".toColor(),
                  child: SizedBox(
                    height: 26,
                    width: 26,
                    child: Icon(MdiIcons.walletPlusOutline,
                        color: Colors.black.withOpacity(0.54)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomTabbar(
                onTap: (index) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
