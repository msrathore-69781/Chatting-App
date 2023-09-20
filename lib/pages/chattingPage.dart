import 'package:chatpp/Models/ChatModel.dart';
import 'package:chatpp/Screens/ContactSelection.dart';
import 'package:chatpp/customUI/ChatChatCard.dart';
import 'package:flutter/material.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> chats =[ ChatModel("sanna","personImage.svg", false, "4:00", "Nice job bhaiya",""),
    ChatModel("Chacha","personImage.svg", false, "8:00", "Nice job beta",""),
    ChatModel("Family","groupImage.svg", true, "5:00", "Damn bruh","")
];
   
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            
          },
          child: ChatCard(chtmdl: chats[index],));
      },itemCount: chats.length ,),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Color.fromRGBO(28, 37, 67, 1),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ContactSelection();
          },));
        
      },child: Icon(Icons.chat,color: Colors.white,),),
    );
}}