import 'package:chatpp/Models/ChatModel.dart';
import 'package:chatpp/pages/IndividualChatPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonCard extends StatelessWidget {
  // final ChatModel chtmdl;
  final String name;
  final IconData icon;
  const ButtonCard( this.name, this.icon);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Color.fromRGBO(28, 37, 67, 1),
            radius: 25,
            child: Icon(icon),
          ),
         
          title: Text(
            name,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 20),
          child: Divider(
            thickness: 0.5,
          ),
        )
      ],
    );
  }
}
