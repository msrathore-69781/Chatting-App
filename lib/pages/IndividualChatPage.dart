import 'package:chatpp/Models/ChatModel.dart';
import 'package:chatpp/customUI/OurMessageCard.dart';
import 'package:chatpp/customUI/ReplyCart.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualChat extends StatefulWidget {
  final ChatModel chmdl;
  const IndividualChat(this.chmdl);

  @override
  State<IndividualChat> createState() => _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> {
  bool showEmoji = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  late IO.Socket socket;
  @override
  void initState() {
    
    // TO DO: implement initState
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEmoji = false;
        });
      }
    });
  }
void connect(){
  socket = IO.io("http://10.7.38.92:8000",<String,dynamic>{
    "transports":["websocket"],
    "autoConnect":false,

  });
  socket.connect();
  socket.onConnect((data) => print("connected"));
  print(socket.connected);

socket.onConnectError((error) {
  print("Connection Error: $error");
});

socket.onError((error) {
  print("Socket Error: $error");
});

//send the message from frontend to the backend
socket.emit("/test","hello bhai from sanna");


}
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset("assets/bgImage.jpeg"),
        Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            leadingWidth: 70,
            titleSpacing: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  CircleAvatar(
                    radius: 20,
                    child: SvgPicture.asset(
                      widget.chmdl.isGroup
                          ? "assets/groupImage.svg"
                          : "assets/personImage.svg",
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                  ),
                ],
              ),
            ),
            title: InkWell(
              onTap: () {
                //code to see the profile
              },
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chmdl.name,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Last seen at 12:00Pm",
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.call_outlined)),
              IconButton(onPressed: () {}, icon: Icon(Icons.videocam_rounded)),
              PopupMenuButton<String>(
                onSelected: (value) {
                  print(value);
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text("new group"),
                      value: "NewGroup",
                    ),
                    PopupMenuItem(
                      child: Text("See profile"),
                      value: "See Profile",
                    ),
                    PopupMenuItem(
                      child: Text("some more features"),
                      value: "some more features",
                    ),
                    PopupMenuItem(
                      child: Text("settings"),
                      value: "settings",
                    )
                  ];
                },
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.only(bottom: 20),
            child: WillPopScope(
              onWillPop: () {
                if (showEmoji)
                  setState(() {
                    showEmoji = false;
                  });
                else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
              child: Stack(
                children: [
                  Container(height: height*0.8,
                    child: ListView(
                      children: [OurMessage(), ReplyCart(),
                      OurMessage(), ReplyCart(),
                      OurMessage(), ReplyCart(),
                      OurMessage(), ReplyCart(),
                      OurMessage(), ReplyCart(),
                      OurMessage(), ReplyCart(),
                      OurMessage(), ReplyCart(),
                      OurMessage(), ReplyCart(),
                      OurMessage(), ReplyCart(),
                      OurMessage(), ReplyCart(),
                      OurMessage(), ReplyCart(),],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 3),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Container(
                                    width: width * 0.85,
                                    child: Card(
                                        margin: EdgeInsets.only(
                                            left: 2, right: 2, bottom: 8),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: TextFormField(
                                          focusNode: focusNode,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          keyboardType: TextInputType.multiline,
                                          //uptill 5 lines it will expand and then we will be able to type the message but scrolling will occur
                                          maxLines: 5,
                                          minLines: 1,
                                          controller: _controller,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(5),
                                              prefixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    focusNode.unfocus();
                                                    focusNode.canRequestFocus =
                                                        false;
                                                    showEmoji = !showEmoji;
                                                  });
                                                },
                                                icon:
                                                    Icon(Icons.emoji_emotions),
                                              ),
                                              suffixIcon: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        showModalBottomSheet(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return bottomSheet();
                                                          },
                                                        );
                                                      },
                                                      icon: Icon(
                                                          Icons.attach_file)),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                          Icons.camera_alt)),
                                                ],
                                              ),
                                              hintText: "chat and interact"),
                                        ))),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8, right: 1),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 20,
                                  child: IconButton(
                                    icon: Icon(Icons.mic),
                                    onPressed: () {},
                                  ),
                                ),
                              )
                            ],
                          ),
                          showEmoji ? emojiSelect() : Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        //remove the print line after testing phase of app is over
        print(emoji);
        // this is a very important line

        _controller.text = _controller.text + emoji.emoji;
      },
    );
  }

  Widget iconCreation(IconData icon, Color color, String txt) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black,
          child: Icon(
            icon,
            color: color,
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Text(txt),
        SizedBox(
          height: 3,
        )
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.2,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconCreation(Icons.insert_drive_file_rounded, Colors.white,
                      "Document"),
                  iconCreation(Icons.camera_alt, Colors.white, "Camera"),
                  iconCreation(Icons.insert_photo, Colors.white, "Photo"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconCreation(
                      Icons.spatial_audio_off_rounded, Colors.white, "Audio"),
                  iconCreation(
                      Icons.location_on_sharp, Colors.white, "Location"),
                  iconCreation(Icons.contact_phone, Colors.white, "Contact"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
