import 'package:bloc/bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/contact/contacts.actions.dart';
import 'package:dwm_flutter_contact_app/bloc/contact/contacts.state.dart';
import 'package:dwm_flutter_contact_app/bloc/message/message.actions.dart';
import 'package:dwm_flutter_contact_app/bloc/message/message.bloc.dart';
import 'package:dwm_flutter_contact_app/enums/request.state.bloc.dart';
import 'package:dwm_flutter_contact_app/model/contact.model.dart';
import 'package:dwm_flutter_contact_app/repositories/contacts.repository.dart';



class ContactsBloc extends Bloc<ContactsEvent, ContactsState>{

  ContactsRepository contactsRepository;
  MessageBloc messageBloc;

  ContactsBloc({ContactsState initialState, this.contactsRepository, this.messageBloc}) : super(initialState);

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if(event is LoadAllContacsEvent){  // Load all contacts
      yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, currentEvent: event, errorMessage: '');
      try{
        List<Contact> data = await contactsRepository.allContacts();
        yield ContactsState(contacts: data, requestState: RequestState.LOADED, currentEvent: event, errorMessage: '', currentContact: data[0]);
        messageBloc.add(new MessagesByContacEvent(data[0]));
      }catch(e){
        yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.toString(), currentEvent: event);
      }
    } else if(event is LoadStudentsEvent){  // Load students contact
      yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, currentEvent: event, errorMessage: '');
      try{
        List<Contact> data = await contactsRepository.contactsByType('STUDENT');
        yield ContactsState(contacts: data, requestState: RequestState.LOADED, currentEvent: event, errorMessage: '');
      }catch(e){
        yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.toString(), currentEvent: event);
      }
    } else if(event is LoadDevelopersEvent){  // Load developers contact
      yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, currentEvent: event, errorMessage: '');
      try{
        List<Contact> data = await contactsRepository.contactsByType('DEVELOPER');
        yield ContactsState(contacts: data, requestState: RequestState.LOADED, currentEvent: event, errorMessage: '');
      }catch(e){
        yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.toString(), currentEvent: event);
      }
    }
  }

}