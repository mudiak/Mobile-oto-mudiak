part of 'widgets.dart';

class DialogPopUp extends StatelessWidget {
  String data;
  DialogPopUp(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height / 4,
            20, MediaQuery.of(context).size.height / 4),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.lightBlue.withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white),
        child: Center(
          child: QrImage(
              version: 3,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              data: data),
        ),
      ),
    );
  }
}
