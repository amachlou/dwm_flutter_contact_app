import 'package:dwm_flutter_contact_app/bloc/message/message.actions.dart';
import 'package:dwm_flutter_contact_app/model/contact.model.dart';
import 'package:dwm_flutter_contact_app/model/message.model.dart';


enum RequestState {LOADING, LOADED, ERROR, NONE}

class MessageState{

  List<Message> messages;
  RequestState requestState;
  String errorMessage;
  MessageEvent currentEvent;

  MessageState({ required this.messages, required this.requestState, required this.errorMessage, required this.currentEvent});

  MessageState.initialeState() : requestState = RequestState.NONE, messages = [], errorMessage = '', currentEvent;
}
