import 'package:bloc/bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/message/message.actions.dart';
import 'package:dwm_flutter_contact_app/bloc/message/message.state.dart';
import 'package:dwm_flutter_contact_app/enums/request.state.bloc.dart';
import 'package:dwm_flutter_contact_app/model/message.model.dart';
import 'package:dwm_flutter_contact_app/repositories/messages.repository.dart';



class MessageBloc extends Bloc<MessageEvent, MessageState>{

  MessageRepository messageRepository;

  MessageBloc({ MessageState initialeState, this.messageRepository}) : super(initialeState);

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    if(event is MessagesByContacEvent){
      yield MessageState(messages: state.messages, requestState: RequestState.LOADING, errorMessage: '', currentEvent: event);
      try{
        print('=====> 222222222222222222');
        print('=====> Event : ${event}');
        print('=====> event.payload : ${event.payload}');
        print('=====> 222222222222222222');
        List<Message> data = await messageRepository.allMessages(); //.messagesByContact(event.payload.id); // Id of contact
        // print('=====> ID: ${event.payload.id}');
        yield MessageState(messages: data, requestState: RequestState.LOADED, errorMessage: '', currentEvent: event);
      }catch(e){
        yield MessageState(messages: state.messages, requestState: RequestState.ERROR, errorMessage: e.toString(), currentEvent: event);
      }
    } else if(event is AddNewMessageEvent){
      yield MessageState(messages: state.messages, requestState: RequestState.LOADING, errorMessage: '', currentEvent: event);
      try{
        print('MEssageBloc');
        event.payload.dateTime = DateTime.now();
        Message message = await messageRepository.addNewessage(event.payload);
        List<Message> data = [...state.messages];
        data.add(message);
        yield MessageState(messages: data, requestState: RequestState.LOADED, errorMessage: '', currentEvent: event);
        print('END MEssageBLOC');
      }catch(e){
        yield MessageState(messages: state.messages, requestState: RequestState.ERROR, errorMessage: e.toString(), currentEvent: event);
      }
    }
  }

}