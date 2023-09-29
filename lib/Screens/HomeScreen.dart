import 'package:chatpp/Models/ChatModel.dart';
import 'package:chatpp/pages/CameraPage.dart';
import 'package:chatpp/pages/chattingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  List<ChatModel> chatModels;
  final ChatModel sourceChat;
  HomeScreen(this.chatModels, this.sourceChat);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? contl;

  @override
  @override
  void initState() {
    super.initState();
    contl = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 25,
              // child: SvgPicture.asset(
              //   "assets/robotChat.svg",
              //   color: Colors.white,
              //   height: 25,
              //   width: 25,
              // ),
            ),
          ),
          // IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: Text("new group")),
                PopupMenuItem(child: Text("See profile")),
                PopupMenuItem(
                  child: Text("some more features"),
                ),
                PopupMenuItem(child: Text("settings"))
              ];
            },
          ),
        ],
        centerTitle: true,
        title: Text("SANN"),
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: contl,
          tabs: [
            // Tab(
            //   icon: Icon(Icons.camera),
            // ),
            Tab(
              text: "Chats",
            ),
          ],
        ),
      ),
      body: TabBarView(controller: contl, children: [
        // CameraPage(),
        ChattingPage(widget.chatModels, widget.sourceChat),
      ]),
    );
  }
}
