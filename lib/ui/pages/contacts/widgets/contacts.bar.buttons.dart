import 'package:dwm_flutter_contact_app/bloc/contact/contacts.actions.dart';
import 'package:dwm_flutter_contact_app/ui/pages/contacts/widgets/contacts.button.item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsBarButtons extends StatelessWidget {
  // const ContactsBarButtons({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7.0),
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
