import 'package:dwm_flutter_contact_app/bloc/contact/contacts.actions.dart';
import 'package:dwm_flutter_contact_app/bloc/contact/contacts.bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/contact/contacts.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsButtonItem extends StatelessWidget {
  String buttonLabel;
  ContactsEvent contactsEvent;

  ContactsButtonItem({this.buttonLabel, this.contactsEvent});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state){
        return Container(
          padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
          decoration: BoxDecoration(
              border: Border.all(
                  width: (state.currentEvent.runtimeType == contactsEvent.runtimeType ? 2 : 0),
                  color: Colors.lightGreen
              )
          ),
          child: RaisedButton(onPressed: () => {
            context.read<ContactsBloc>().add(contactsEvent)
          }, child: Text(buttonLabel, style: TextStyle(color: Colors.blue)), color: Colors.cyan,),
        );
      },
    );
  }
}
