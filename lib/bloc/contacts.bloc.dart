import 'package:bloc/bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/contacts.actions.dart';
import 'package:dwm_flutter_contact_app/bloc/contacts.state.dart';
import 'package:dwm_flutter_contact_app/model/contact.model.dart';
import 'package:dwm_flutter_contact_app/repositories/contacts.repository.dart';
import 'package:flutter/material.dart';



class ContactsBloc extends Bloc<ContactsEvent, ContactsState>{

  ContactsRepository contactsRepository;

  ContactsBloc({ContactsState initialState, this.contactsRepository}) : super(initialState);

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if(event is LoadAllContacsEvent){  // Load all contacts
      yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, currentEvent: event);
      try{
        List<Contact> data = await contactsRepository.allContacts();
        yield ContactsState(contacts: data, requestState: RequestState.LOADED, currentEvent: event);
      }catch(e){
        yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.message, currentEvent: event);
      }
    } else if(event is LoadStudentsEvent){  // Load students contact
      yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, currentEvent: event);
      try{
        List<Contact> data = await contactsRepository.contactsByType('STUDENT');
        yield ContactsState(contacts: data, requestState: RequestState.LOADED, currentEvent: event);
      }catch(e){
        yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.message, currentEvent: event);
      }
    } else if(event is LoadDevelopersEvent){  // Load developers contact
      yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, currentEvent: event);
      try{
        List<Contact> data = await contactsRepository.contactsByType('DEVELOPER');
        yield ContactsState(contacts: data, requestState: RequestState.LOADED, currentEvent: event);
      }catch(e){
        yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.message, currentEvent: event);
      }
    }
  }

}