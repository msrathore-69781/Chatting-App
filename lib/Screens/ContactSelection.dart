import 'package:chatpp/Models/ChatModel.dart';
import 'package:chatpp/Screens/CreateGroup.dart';
import 'package:chatpp/customUI/ButtonCard.dart';
import 'package:chatpp/customUI/ContactsCard.dart';
import 'package:chatpp/pages/IndividualChatPage.dart';
import 'package:flutter/material.dart';
 class ContactSelection extends StatefulWidget {
   const ContactSelection({super.key});
   @override
   State<ContactSelection> createState() => _ContactSelectionState();
 }
 class _ContactSelectionState extends State<ContactSelection> {
   @override
   Widget build(BuildContext context) {
     List<ChatModel> contacts = [
      ChatModel(1, "sanna","personImage.svg", false, "4:00", "", "I am free to chat between 4 to 6 pm"),
      ChatModel( 2, "chacha","personImage.svg", false, "4:00", "", "I am free to chat between 10 to 12 pm"),
      ChatModel( 2, "tinku","personImage.svg", false, "4:00", "", "I am free to chat between 8 to 10 am"),
     ];
     return Scaffold(
        appBar: AppBar(title: Column(
          mainAxisAlignment: MainAxisAlignment.start
          ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text("500 contacts",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),)
          ],
        ),
        actions: [IconButton(onPressed: () {
          
        }, icon: Icon(Icons.search,size: 26,)),
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
                )];
            },
          )
        ],
        ),
        body: ListView.builder(
           itemCount: contacts.length+1,
          itemBuilder: (context, index) {
      
          if(index == 0 ){
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CreateGroup();
                },));
              },
              child: ButtonCard("New group",Icons.group_add));
          }
          
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                   return Container();
                    // return IndividualChat(contacts[index]);
                  },));
                },
                child: ContactCard(contacts[index-1]));
        },
        
        )

     ); 
   }
 }