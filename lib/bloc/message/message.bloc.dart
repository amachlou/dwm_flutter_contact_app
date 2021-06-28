import 'package:bloc/bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/message/message.actions.dart';
import 'package:dwm_flutter_contact_app/bloc/message/message.state.dart';
import 'package:dwm_flutter_contact_app/enums/request.state.bloc.dart';
import 'package:dwm_flutter_contact_app/model/message.model.dart';
import 'package:dwm_flutter_contact_app/repositories/messages.repository.dart';



class MessageBloc extends Bloc<MessageEvent, MessageState>{

  MessageRepository messageRepository;
  MessageBloc messageBloc;

  MessageBloc({ MessageState initialeState, this.messageRepository, this.messageBloc}) : super(initialeState);

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    if(event is MessagesByContacEvent){
      yield MessageState(messages: state.messages, requestState: RequestState.LOADING, errorMessage: '', currentEvent: event, currentContact: event.payload);
      try{
        List<Message> data = await messageRepository.allMessages(); //.messagesByContact(event.payload.id); // Id of contact
        yield MessageState(messages: data, requestState: RequestState.LOADED, errorMessage: '', currentEvent: event, currentContact: event.payload);
        // messageBloc.add(new MessagesByContacEvent(data[0]));
      }catch(e){
        yield MessageState(messages: state.messages, requestState: RequestState.ERROR, errorMessage: e.toString(), currentEvent: event, currentContact: event.payload);
      }
    } else if(event is AddNewMessageEvent){
      // yield MessageState(messages: state.messages, requestState: RequestState.LOADING, errorMessage: '', currentEvent: event);
      try{
        event.payload.dateTime = DateTime.now();
        Message message = await messageRepository.addNewessage(event.payload);
        List<Message> data = [...state.messages];
        data.add(message);
        yield MessageState(messages: data, requestState: RequestState.LOADED, errorMessage: '', currentEvent: event);
      }catch(e){
        yield MessageState(messages: state.messages, requestState: RequestState.ERROR, errorMessage: e.toString(), currentEvent: event);
      }
    }
  }

}