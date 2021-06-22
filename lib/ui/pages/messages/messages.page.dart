import 'package:dwm_flutter_contact_app/model/contact.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  // const MessagesPage({required Key key}) : super(key: key);
  late Contact contact;

  @override
  Widget build(BuildContext context) {
    this.contact = ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(title: Text('${contact.name}\'s messages'),),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  child: Text('${contact.profile}'),
                ),
                SizedBox(width: 10,),
                Text('${contact.name}')
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Text('Messages list'),
              // padding: EdgeInsets.all(16),
              // child: Row(
              //   children: [
              //     CircleAvatar(
              //       child: Text('${contact.profile}'),
              //     ),
              //     SizedBox(width: 10,),
              //     Text('${contact.name}')
              //   ],
              // ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Messages from'),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}
