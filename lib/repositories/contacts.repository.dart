import 'dart:math';

import 'package:dwm_flutter_contact_app/model/contact.model.dart';

class ContactsRepository {

  Map<int,Contact> contacts = {
    1:Contact(id: 1, name: 'Mohammed', profile: 'MO', type: 'STUDENT', score: 10),
    2:Contact(id: 2, name: 'Hassan', profile: 'HA', type: 'DEVELOPER', score: 22),
    3:Contact(id: 3, name: 'Jihane', profile: 'JI', type: 'STUDENT', score: 33),
    4:Contact(id: 4, name: 'Hassna', profile: 'HA', type: 'DEVELOPER', score: 44),
    5:Contact(id: 5, name: 'Salim', profile: 'SA', type: 'STUDENT', score: 55)
  };

  Future<List<Contact>> allContacts() async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(rnd > 1){
      return contacts.values.toList();
    }else{
      throw new Exception(("Network connexion"));
    }
  }

  Future<List<Contact>> contactsByType(String type) async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(rnd > 3){
      return contacts.values.toList().where((element) => element.type == type).toList();
    }else{
      throw new Exception(("Network connexion"));
    }
  }

}