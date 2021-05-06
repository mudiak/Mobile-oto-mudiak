part of 'widgets.dart';

class ItemTiket extends StatefulWidget {
  @override
  _ItemTiketState createState() => _ItemTiketState();
}

class _ItemTiketState extends State<ItemTiket> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: ClipPath(
        clipper: ItemClipperatas(),
        child: ClipPath(
          clipper: ItemClipperbawah(),
          child: Container(
            height: 90,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class ItemClipperatas extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 5 - 20, 0);
    path.quadraticBezierTo(size.width / 5 - 20, 20, size.width / 5, 20);
    path.quadraticBezierTo(size.width / 5 + 20, 20, size.width / 5 + 20, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ItemClipperbawah extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width / 5 - 20, size.height);
    path.quadraticBezierTo(
        size.width / 5, 40, size.width / 5 + 20, size.height);
    path.quadraticBezierTo(size.width / 5 + 40, 40, size.width / 5, 0);
    path.quadraticBezierTo(size.width / 5, size.height, size.width / 5, 0);
    path.quadraticBezierTo(
        size.width / 5, 20, size.width / 5 + 20, size.height);
    // path.lineTo(size.width / 5 + 20, size.height * 0.75);
    // path.quadraticBezierTo(size.width / 5 + 20, 20, size.width / 5 + 20, 0);
    // path.quadraticBezierTo(
    //   20,
    //   size.height / 5 - 20,
    //   20,
    //   size.height / 5,
    // );
    // // path.quadraticBezierTo(20, size.width / 5 + 20, 0, size.width / 5 + 20);
    // path.lineTo(0, size.width);

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // path.lineTo(size.height, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
