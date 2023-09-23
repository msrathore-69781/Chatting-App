import 'package:chatpp/Models/ChatModel.dart';
import 'package:chatpp/Screens/ContactSelection.dart';
import 'package:chatpp/customUI/ChatChatCard.dart';
import 'package:chatpp/pages/IndividualChatPage.dart';
import 'package:flutter/material.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  @override
  Widget build(BuildContext context) {
   
   
    return Scaffold(
      // body: ListView.builder(itemBuilder: (context, index) {
      //   return InkWell(
      //     onTap: () {
      //      IndividualChat(chats[index]);
      //     },
      //     child: ChatCard(chtmdl: chats[index],));
      // },itemCount: chats.length ,),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor:  Color.fromRGBO(28, 37, 67, 1),
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) {
      //       return ContactSelection();
      //     },));
        
      // },child: Icon(Icons.chat,color: Colors.white,),),
    );
}}