class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  String status;
  bool selectedForGroup = false;
  int id;

  ChatModel(this.id, this.name, this.icon, this.isGroup, this.time,
      this.currentMessage, this.status,
      {this.selectedForGroup = false}) {}
}
