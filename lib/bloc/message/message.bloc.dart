import 'package:bloc/bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/message/message.actions.dart';
import 'package:dwm_flutter_contact_app/bloc/message/message.state.dart';
import 'package:dwm_flutter_contact_app/model/message.model.dart';
import 'package:dwm_flutter_contact_app/repositories/messages.repository.dart';



class MessageBloc extends Bloc<MessageEvent, MessageState>{

  MessageRepository messageRepository;

  MessageBloc({ required MessageState initialeState, required this.messageRepository}) : super(initialeState);

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    if(event is MessagesByContacEvent){
      yield MessageState(messages: state.messages, requestState: RequestState.LOADING, errorMessage: '', currentEvent: event);
      try{
        List<Message> data = await messageRepository.messagesByContact(event.payload.id); // Id of contact
        yield MessageState(messages: data, requestState: RequestState.LOADED, errorMessage: '', currentEvent: event);
      }catch(e){
        yield MessageState(messages: state.messages, requestState: RequestState.ERROR, errorMessage: e.toString(), currentEvent: event);
      }
    } else if(event is AddNewMessageEvent){
      yield MessageState(messages: state.messages, requestState: RequestState.LOADING, errorMessage: '', currentEvent: event);
      try{
        List<Message> data = await messageRepository.allMessages();
        yield MessageState(messages: data, requestState: RequestState.LOADED, errorMessage: '', currentEvent: event);
      }catch(e){
        yield MessageState(messages: state.messages, requestState: RequestState.ERROR, errorMessage: e.toString(), currentEvent: event);
      }
    }
  }

}