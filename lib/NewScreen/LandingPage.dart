import 'package:chatpp/NewScreen/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: SafeArea(
            child: Column(
          children: [
            Center(
              child: Text(
                "SANN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 29,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Center(
              child: Text(
                "Happy Messaging",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 29,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: height / 8,
            ),
            Image.asset(
              "assets/sannLogo.jpeg",
              height: 180,
              width: 180,
            ),
            SizedBox(
              height: height * 0.3,
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ), (route) => false);
              },
              child: Container(
                width: width - 110,
                height: 50,
                child: Card(
                  margin: EdgeInsets.all(0),
                  elevation: 8,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      "AGREE AND CONTINUE",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                      ),
                      children: [
                    TextSpan(text: "Agree and continue to accept the"),
                    TextSpan(
                        text: "Sann terms of service and privacy policy",
                        style: TextStyle(color: Colors.cyan))
                  ])),
            ),
          ],
        )),
      ),
    );
  }
}
