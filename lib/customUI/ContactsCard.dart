import 'package:chatpp/Models/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  const ContactCard(this.contacts);
final ChatModel contacts; 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color.fromRGBO(28, 37, 67, 1),
          radius: 25,
          child: SvgPicture.asset(
            "assets/person.svg",
            color: Colors.white,
            height: 30,
            width: 30,
          ),
        ),
        title: Text(
          contacts.name,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(contacts.status),
        
      ),
    );
  }
}
