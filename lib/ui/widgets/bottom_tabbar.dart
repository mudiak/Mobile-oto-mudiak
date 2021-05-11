part of 'widgets.dart';

class BottomTabbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  BottomTabbar({this.selectedIndex = 0, this.onTap});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomNavBarClipper(),
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap(0);
                }
              },
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 40,
                    // margin: EdgeInsets.symmetric(horizontal: 83),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/home" +
                                ((selectedIndex == 0)
                                    ? '_active.png'
                                    : '.png')),
                            fit: BoxFit.contain)),
                  ),
                  Text(
                    "New Ticket",
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400,
                        color:
                            (selectedIndex == 0) ? Colors.black : Colors.grey),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap(1);
                }
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    width: 60,
                    height: 40,
                    // margin: EdgeInsets.symmetric(horizontal: 83),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/history" +
                                ((selectedIndex == 1)
                                    ? '_active.png'
                                    : '.png')),
                            fit: BoxFit.contain)),
                  ),
                  Text(
                    "My Ticket",
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400,
                        color:
                            (selectedIndex == 1) ? Colors.black : Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
