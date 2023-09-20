import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class GroupMember extends StatelessWidget {
  const GroupMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
                children :[CircleAvatar(
                  backgroundColor: Color.fromRGBO(28, 37, 67, 1),
                  radius: 25,
                  child: SvgPicture.asset(
                    
                        "assets/personImage.svg",
                    color: Colors.white,
                    height: 30,
                  ),
                ),
               Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.clear)),
                )]
              ),
              Text("name",style: TextStyle(color: Colors.white,fontSize: 18),)
        ],
      ),
    );
  }
}