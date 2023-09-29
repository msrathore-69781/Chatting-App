import 'package:flutter/material.dart';

class ReplyCart extends StatelessWidget {
  String msg;
 ReplyCart(this.msg);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 50, top: 10, bottom: 20),
                child: Text(
                  msg,

                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  "",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
