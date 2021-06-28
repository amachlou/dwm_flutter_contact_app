import 'package:dwm_flutter_contact_app/model/message.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  Message message;

  MessageItem(this.message);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.type == 'received'
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        message.type == 'sent' ? SizedBox(width: 0) : SizedBox(width: 30),
        Flexible(
          child: Container(
            color: message.type == 'received'
                ? Colors.amberAccent
                : Colors.greenAccent,
            padding: EdgeInsets.all(10),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.lightGreen, width: 1),
            ),
            child: Text(
                '${message.content} (${message.dateTime.hour}:${message.dateTime.minute})'),
          ),
        ),
        message.type == 'received' ? SizedBox(width: 30) : SizedBox(width: 0),
      ],
    );
  }
}
