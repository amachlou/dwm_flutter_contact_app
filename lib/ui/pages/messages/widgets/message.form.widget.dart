import 'package:dwm_flutter_contact_app/bloc/message/message.actions.dart';
import 'package:dwm_flutter_contact_app/bloc/message/message.bloc.dart';
import 'package:dwm_flutter_contact_app/model/contact.model.dart';
import 'package:dwm_flutter_contact_app/model/message.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesForm extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();
  Contact contact;

  MessagesForm(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                controller: textEditingController,
                keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            )),
          )),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              Message message = Message(type: 'sent', contactId: contact.id, content: textEditingController.text);
              context.read<MessageBloc>().add(new AddNewMessageEvent(message));

              Message reply = Message(type: 'received', contactId: contact.id, content: 'Answer to ${textEditingController.text}');
              context.read<MessageBloc>().add(new AddNewMessageEvent(reply));

              textEditingController.text = '';
            },
          )
        ],
      ),
    );
  }
}
