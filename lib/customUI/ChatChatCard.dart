import 'package:chatpp/Models/ChatModel.dart';
import 'package:chatpp/pages/IndividualChatPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatCard extends StatefulWidget {
  final ChatModel chtmdl;
  final ChatModel sourceChat;
  
ChatCard(this.chtmdl,this.sourceChat);

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) {
           return IndividualChat(widget.chtmdl,widget.sourceChat);
         },));
      },
      child: Column(
        children: [
          ListTile(
            // onTap: () {
            //   IndividualChat(chtmdl);
            // },
            leading: Container(
              height: 50,
              width: 50,
              child: Stack(
                children :[CircleAvatar(
                  backgroundColor: Color.fromRGBO(28, 37, 67, 1),
                  radius: 25,
                  child: SvgPicture.asset(
                    widget.chtmdl.isGroup
                        ? "assets/groupImage.svg"
                        : "assets/personImage.svg",
                    color: Colors.white,
                  ),
                ),
               widget.chtmdl.selectedForGroup? Positioned(
                  // bottom: 4,
                  // right: 5,
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.check)),
                ):Container()]
              ),
            ),  
            trailing: Text(widget.chtmdl.time),
            title: Text(
              widget.chtmdl.name,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text(widget.chtmdl.currentMessage),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 20),
            child: Divider(
              thickness: 0.5,
            ),
          )
        ],
      ),
    );
  }
}
