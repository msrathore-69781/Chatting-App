import 'package:chatpp/Models/CountryModel.dart';
import 'package:chatpp/NewScreen/CountryPage.dart';
import 'package:chatpp/NewScreen/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUP> {
  String email = "";
  String password = "";
  String name = "";
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  late IO.Socket socket;
  @override
  void connect() {
    socket = IO.io("http://10.7.15.119:8080/", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.onConnect((data) => print("connected"));
    print(socket.connected);

    socket.onConnectError((error) {
      print("Connection Error: $error");
    });

    socket.onError((error) {
      print("Socket Error: $error");
    });
  }

  void initState() {
    // TO DO: implement initState
    super.initState();
    connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "SignUp",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            wordSpacing: 1,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Enter your name"),
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5 - 50,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.black,
                    width: 1.8,
                  ))),
                  child: TextFormField(
                    controller: _controllerName,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(9),
                        hintText: "Enter Name"),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Enter your email id"),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5 - 50,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.black,
                    width: 1.8,
                  ))),
                  child: TextFormField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(9),
                        hintText: "Enter email id"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Enter your password"),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5 - 50,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.black,
                    width: 1.8,
                  ))),
                  child: TextFormField(
                    obscureText: true,
                    controller: _controllerPassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(9),
                        hintText: "Enter password"),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Confirm your password"),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5 - 50,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.black,
                    width: 1.8,
                  ))),
                  child: TextFormField(
                    obscureText: true,
                    controller: _controllerPassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(9),
                        hintText: "Enter your password again"),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(

                  builder: (context) {
                   return LoginPage();
                  },
                )
                );
                  setState(() {
                    name = _controllerName.text.toString();
                    email = _controllerEmail.text.toString();
                    password = _controllerPassword.text.toString();
                  });
                  sendMessage(email, password);
                },
                child: Text("Signup")),
                

          ],
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.black,
    //     elevation: 0,
    //     title: Text(
    //       "Enter your phone number",
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontWeight: FontWeight.w700,
    //         fontSize: 18,
    //         wordSpacing: 1,
    //       ),
    //     ),
    //     centerTitle: true,
    //     actions: [
    //       Icon(
    //         Icons.more_vert,
    //         color: Colors.black,
    //       )
    //     ],
    //   ),
    //   body: Container(
    //     height: MediaQuery.of(context).size.height,
    //     width: MediaQuery.of(context).size.width,
    //     child: Column(
    //       children: [
    //         Text(
    //           "Sann will send you an sms message to verify your number",
    //           style: TextStyle(fontSize: 13.5),
    //         ),
    //         SizedBox(
    //           height: 5,
    //         ),
    //         Text(
    //           "what's my number",
    //           style: TextStyle(fontSize: 12.8, color: Colors.cyan),
    //         ),
    //         SizedBox(
    //           height: 15,
    //         ),
    //         countryCard(),
    //         SizedBox(
    //           height: 15,
    //         ),
    //         number(),
    //         Expanded(child: Container()),
    //         InkWell(
    //           onTap: () {
    //             showMyDialogue();
    //           },
    //           child: Container(
    //             color: Colors.tealAccent,
    //             height: 40,
    //             width: 70,
    //             child: Center(
    //               child: Text(
    //                 "Next",
    //                 style: TextStyle(fontWeight: FontWeight.w600),
    //               ),
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 40,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  void sendMessage(String email, String password) {
    socket.emit("sigup", {"name": name, "email": email, "password": password});
    // print(email);
  }
  // Widget countryCard() {
  //   return InkWell(
  //     onTap: () {
  //       // Navigator.push(context, MaterialPageRoute(
  //       //   builder: (context) {
  //       //     return CountryPage(setCountryCode);
  //       //   },
  //       // ));
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width / 1.5,
  //       padding: EdgeInsets.symmetric(vertical: 5),
  //       decoration: BoxDecoration(
  //           border: Border(
  //               bottom: BorderSide(
  //         color: Colors.black,
  //         width: 1.8,
  //       ))),
  //       child: Row(
  //         children: [
  //           Container(
  //             child: Center(
  //               child: Text(
  //                 "",
  //                 style: TextStyle(fontSize: 16),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget number() {
  //   return Container(
  //     width: MediaQuery.of(context).size.height,
  //     padding: EdgeInsets.only(left: 40),
  //     height: 38,
  //     child: Row(
  //       children: [
  //         Container(
  //           width: 70,
  //           decoration: BoxDecoration(
  //               border: Border(
  //                   bottom: BorderSide(
  //             color: Colors.black,
  //             width: 1.8,
  //           ))),
  //           child: Padding(
  //             padding: const EdgeInsets.only(top: 13),
  //             child: Row(
  //               children: [
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Text(
  //                   "",
  //                   style: TextStyle(fontSize: 18),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           width: 15,
  //         ),
  //         Container(
  //           width: MediaQuery.of(context).size.width / 1.5 - 50,
  //           decoration: BoxDecoration(
  //               border: Border(
  //                   bottom: BorderSide(
  //             color: Colors.black,
  //             width: 1.8,
  //           ))),
  //           child: TextFormField(
  //             controller: _controllerEmail,
  //             keyboardType: TextInputType.number,
  //             decoration: InputDecoration(
  //                 border: InputBorder.none,
  //                 contentPadding: EdgeInsets.all(9),
  //                 hintText: "Enter password"),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  bool checkDetails(String email, String password) {
    if (email == "" || password == "") {
      return false;
    }
    setState(() {
      ;
      email = email;
      password = password;
    });
    showMyDialogue2();
    Navigator.pop(context);
    return true;
  }

  // Future<void> showMyDialogue() {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return CupertinoAlertDialog(
  //         content: SingleChildScrollView(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 "We will be veryfying your phone number",
  //                 style: TextStyle(fontSize: 14),
  //               ),
  //               Center(
  //                 child: Text(countryCode + "" + _controllerEmail.text,
  //                     style: TextStyle(fontSize: 14)),
  //               ),
  //               SizedBox(
  //                 height: 5,
  //               ),
  //               Text("Is this ok, or would you like to edit the number",
  //                   style: TextStyle(fontSize: 13.5))
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text("Edit"),
  //           ),
  //           TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Text("Ok"))
  //         ],
  //       );
  //     },
  //   );
  // }

  Future<void> showMyDialogue2() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You have entered an incorrect number",
                  style: TextStyle(fontSize: 14),
                ),
                // Center(
                //   child: Text(countryCode + "" + _controller.text,
                //       style: TextStyle(fontSize: 14)),
                // ),
                //     SizedBox(height: 5,),
                // Text("Is this ok, or would you like to edit the number",
                //     style: TextStyle(fontSize: 13.5))
              ],
            ),
          ),
          actions: [
            // TextButton(
            //   onPressed: () {   Navigator.pop(context);},
            //   child: Text("Edit"),
            // ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"))
          ],
        );
      },
    );
  }
}
