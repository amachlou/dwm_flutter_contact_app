import 'package:dwm_flutter_contact_app/model/contact.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  List<Contact> contacts;

  ContactsList({this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(height: 2, color: Colors.black12,),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                CircleAvatar(child: Text('${contacts[index].profile}'),),
                SizedBox(width: 15,),
                Text("${contacts[index].name}"),
              ],),
              CircleAvatar(child: Text('${contacts[index].score}'),),
              // Text("${state.contacts[index].name}"),
            ],
          ),
        );
      },
    );
  }
}
