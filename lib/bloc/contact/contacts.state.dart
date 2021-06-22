import 'package:dwm_flutter_contact_app/bloc/contact/contacts.actions.dart';
import 'package:dwm_flutter_contact_app/model/contact.model.dart';


enum RequestState {LOADING, LOADED, ERROR, NONE}

class ContactsState{

  List<Contact> contacts;
  RequestState requestState;
  String errorMessage;
  ContactsEvent currentEvent;

  ContactsState({required this.contacts,required this.requestState, required this.errorMessage, required this.currentEvent});
}
