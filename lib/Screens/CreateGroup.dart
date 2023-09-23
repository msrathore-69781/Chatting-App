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
    ChatModel(1,"sanna", "personImage.svg", false, "4:00", "",
        "I am free to chat between 4 to 6 pm"),
    ChatModel(2,"chacha", "personImage.svg", false, "4:00", "",
        "I am free to chat between 10 to 12 pm"),
  ];
  List<ChatModel> groupsMember = [];
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
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(height: groupsMember.length > 0 ? 90 : 0);
              }
              return InkWell(
                  onTap: () {
                    setState(() {
                      if (contacts[index - 1].selectedForGroup == true) {
                        contacts[index - 1].selectedForGroup = false;
                        groupsMember.remove(contacts[index - 1]);
                      } else {
                        contacts[index - 1].selectedForGroup = true;
                        groupsMember.add(contacts[index - 1]);
                      }
                    });
                  },
                  child: ContactCard(contacts[index - 1]));
            },
          ),
          groupsMember.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 76,
                      color: Color.fromRGBO(28, 37, 67, 1),
                      child: ListView.builder(
                        itemCount: contacts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (contacts[index].selectedForGroup) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    groupsMember.remove(contacts[index]);
                                    contacts[index].selectedForGroup = false;
                                  });
                                },
                                child: GroupMember(contacts[index]));
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    )
                  ],
                )
              : Container(),
        ]));
  }
}
