import 'dart:math';

import 'package:dwm_flutter_contact_app/model/message.model.dart';

class MessageRepository {

  Map<int,Message> messages = {
    1:Message(id: 1, contactId: 1, dateTime: DateTime.now(), content: 'Hello world', type: 'sent'),
    2:Message(id: 2, contactId: 2, dateTime: DateTime.now(), content: 'Thanks Med', type: 'received'),
    3:Message(id: 3, contactId: 1, dateTime: DateTime.now(), content: 'Please', type: 'sent'),
    4:Message(id: 4, contactId: 3, dateTime: DateTime.now(), content: 'Chokran', type: 'received'),
    5:Message(id: 5, contactId: 2, dateTime: DateTime.now(), content: 'Merci', type: 'sent'),
  };

  Future<List<Message>> allMessages() async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(rnd > 1){
      return messages.values.toList();
    }else{
      throw new Exception(("Network connexion"));
    }
  }

  Future<List<Message>> messagesByContact(int contactId) async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(rnd > 3){
      return messages.values.toList().where((element) => element.contactId == contactId).toList();
    }else{
      throw new Exception(("Network connexion"));
    }
  }

}