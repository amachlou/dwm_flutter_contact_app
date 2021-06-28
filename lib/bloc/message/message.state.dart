import 'package:dwm_flutter_contact_app/bloc/message/message.actions.dart';
import 'package:dwm_flutter_contact_app/enums/request.state.bloc.dart';
import 'package:dwm_flutter_contact_app/model/contact.model.dart';
import 'package:dwm_flutter_contact_app/model/message.model.dart';


class MessageState{

  List<Message> messages;
  RequestState requestState;
  String errorMessage;
  MessageEvent currentEvent;
  Contact currentContact;

  MessageState({ this.messages, this.requestState, this.errorMessage, this.currentEvent, this.currentContact});

  MessageState.initialeState() : requestState = RequestState.NONE, messages = [], errorMessage = '', currentEvent = null, currentContact = null;
}
