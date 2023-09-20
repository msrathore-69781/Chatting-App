import 'package:chatpp/Models/ChatModel.dart';
import 'package:chatpp/pages/IndividualChatPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatCard extends StatelessWidget {
  final ChatModel chtmdl;
  const ChatCard({Key? key, required this.chtmdl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 50,
            width: 50,
            child: Stack(
              children :[CircleAvatar(
                backgroundColor: Color.fromRGBO(28, 37, 67, 1),
                radius: 25,
                child: SvgPicture.asset(
                  chtmdl.isGroup
                      ? "assets/groupImage.svg"
                      : "assets/personImage.svg",
                  color: Colors.white,
                ),
              ),
             chtmdl.selectedForGroup? Positioned(
                // bottom: 4,
                // right: 5,
                child: CircleAvatar(
                  radius: 11,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.check)),
              ):Container()]
            ),
          ),  
          trailing: Text(chtmdl.time),
          title: Text(
            chtmdl.name,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(chtmdl.currentMessage),
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
