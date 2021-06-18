import 'package:bloc/bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/contacts.actions.dart';
import 'package:dwm_flutter_contact_app/model/contact.model.dart';
import 'package:dwm_flutter_contact_app/repositories/contacts.repository.dart';
import 'package:flutter/material.dart';


enum RequestState {LOADING, LOADED, ERROR, NONE}

class ContactsState{

  List<Contact> contacts;
  RequestState requestState;
  String errorMessage;
  ContactsEvent currentEvent;

  ContactsState({this.contacts, this.requestState, this.errorMessage, this.currentEvent});
}
