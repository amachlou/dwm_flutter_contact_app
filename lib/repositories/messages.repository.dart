import 'dart:math';

import 'package:dwm_flutter_contact_app/model/message.model.dart';

class MessageRepository {
  int messageCounter = 0;


  Map<int,Message> messages = {
    1:Message(id: 1, contactId: 1, dateTime: DateTime.now(), content: 'Hi', type: 'sent'),
    2:Message(id: 2, contactId: 2, dateTime: DateTime.now(), content: 'Hello', type: 'sent'),
    2:Message(id: 2, contactId: 2, dateTime: DateTime.now(), content: 'How is it going', type: 'received'),
    3:Message(id: 3, contactId: 3, dateTime: DateTime.now(), content: 'I\'m doing great', type: 'sent'),
    4:Message(id: 4, contactId: 4, dateTime: DateTime.now(), content: 'Good', type: 'received'),
  };

  MessageRepository() {
    this.messageCounter = messages.length;
  }

  Future<List<Message>> allMessages() async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(true){
      return messages.values.toList();
    }else{
      throw new Exception("Network connexion");
    }
  }

  Future<List<Message>> messagesByContact(int contactId) async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(true){
      return messages.values.toList().where((element) => element.contactId == contactId).toList();
    }else{
      throw new Exception("Network connexion");
    }
  }

  Future<Message> addNewessage(Message message) async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(rnd > 3){
      message.id = ++messageCounter;
      messages[message.id] = message;
      return message;
    }else{
      throw new Exception("Network connexion");
    }
  }

}