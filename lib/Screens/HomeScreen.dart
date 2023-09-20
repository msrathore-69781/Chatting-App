import 'package:chatpp/pages/chattingPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
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
        title: Text("something creative"),
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: contl,
          tabs: [
            Tab(
              icon: Icon(Icons.camera),
            ),
            Tab(
              text: "Chat",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Calls",
            ),
          ],
        ),
      ),
      body: TabBarView(controller: contl, children: [
        Text("Camera"),
        ChattingPage(),
        Text("Status"),
        Text("Calls"),
      ]),
    );
  }
}
