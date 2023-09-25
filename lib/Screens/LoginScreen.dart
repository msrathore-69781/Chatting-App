import 'package:chatpp/Models/ChatModel.dart';
import 'package:chatpp/Screens/HomeScreen.dart';
import 'package:chatpp/customUI/ButtonCard.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;

  List<ChatModel> chats = [
    ChatModel(
        1, "sanna", "personImage.svg", false, "4:00", "Nice job bhaiya", ""),
    ChatModel(
        2, "Chacha", "personImage.svg", false, "8:00", "Nice job beta", ""),
    ChatModel(101, "Family", "groupsImage.svg", true, "5:00", "Damn bruh", "")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                sourceChat = chats.removeAt(index);
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen(chats, sourceChat);
                  },
                ));
              },
              child: ButtonCard(chats[index].name, Icons.person));
        },
      ),
    );
  }
}
