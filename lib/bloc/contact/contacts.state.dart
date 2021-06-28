import 'package:dwm_flutter_contact_app/bloc/contact/contacts.actions.dart';
import 'package:dwm_flutter_contact_app/enums/request.state.bloc.dart';
import 'package:dwm_flutter_contact_app/model/contact.model.dart';



class ContactsState{

  List<Contact> contacts;
  RequestState requestState;
  String errorMessage;
  ContactsEvent currentEvent;
  Contact currentContact;

  ContactsState({this.contacts, this.requestState, this.errorMessage, this.currentEvent, this.currentContact});
}
