import 'package:chatpp/Models/ChatModel.dart';
import 'package:chatpp/customUI/ButtonCard.dart';
import 'package:chatpp/customUI/ContactsCard.dart';
import 'package:chatpp/customUI/GroupMembers.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});
  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel("sanna", "personImage.svg", false, "4:00", "",
        "I am free to chat between 4 to 6 pm"),
    ChatModel("chacha", "personImage.svg", false, "4:00", "",
        "I am free to chat between 10 to 12 pm"),
  ];
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Group",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Add participants",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 26,
                )),
            PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("invite members"),
                    value: "invite members",
                  ),
                  PopupMenuItem(
                    child: Text("contacts"),
                    value: "contacts",
                  ),
                  PopupMenuItem(
                    child: Text("some more features"),
                    value: "some more features",
                  ),
                  PopupMenuItem(
                    child: Text("health"),
                    value: "health",
                  )
                ];
              },
            )
          ],
        ),
        body: Stack(children: [
          ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    if (contacts[index].selectedForGroup == false) {
                      setState(() {
                        contacts[index].selectedForGroup = true;
                        groups.add(contacts[index]);
                      });
                    } else {
                      setState(() {
                        contacts[index].selectedForGroup = false;
                        groups.remove(contacts[index]);
                      });
                    }
                  },
                  child: ContactCard(contacts[index]));
            },
          ),
          Column(
            children: [

              Container(
                height: 76,
                color: Color.fromRGBO(28, 37, 67, 1),
              child: ListView.builder(
                itemCount: contacts.length,

                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                return GroupMember();
              },),
              ),
              Divider(thickness: 1,)
            ],
          )
        ]));
  }
}
