import 'package:dwm_flutter_contact_app/bloc/contacts.actions.dart';
import 'package:dwm_flutter_contact_app/ui/pages/contacts/widgets/contacts.button.item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsBarButtons extends StatelessWidget {
  const ContactsBarButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContactsButtonItem(buttonLabel: 'All Contacts', contactsEvent: new LoadAllContacsEvent(),),
          ContactsButtonItem(buttonLabel: 'Students', contactsEvent: new LoadStudentsEvent(),),
          ContactsButtonItem(buttonLabel: 'Developers', contactsEvent: new LoadDevelopersEvent(),),
        ],
      ),
    );
  }
}
