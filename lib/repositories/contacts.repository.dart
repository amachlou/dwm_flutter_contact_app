import 'dart:math';

import 'package:dwm_flutter_contact_app/model/contact.model.dart';

class ContactsRepository {

  Map<int,Contact> contacts = {
    1:Contact(id: 1, name: 'Said', profile: 'SA', type: 'STUDENT', score: 10),
    2:Contact(id: 2, name: 'Abderrahim', profile: 'AM', type: 'DEVELOPER', score: 22),
    3:Contact(id: 3, name: 'Jihane', profile: 'JI', type: 'STUDENT', score: 33),
    4:Contact(id: 4, name: 'Rachid', profile: 'HA', type: 'DEVELOPER', score: 44),
    5:Contact(id: 5, name: 'Jack', profile: 'JA', type: 'STUDENT', score: 55)
  };

  Future<List<Contact>> allContacts() async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(true){
      return contacts.values.toList();
    }else{
      throw new Exception("Network connexion");
    }
  }

  Future<List<Contact>> contactsByType(String type) async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(true){
      return contacts.values.toList().where((element) => element.type == type).toList();
    }else{
      throw new Exception("Network connexion");
    }
  }

}