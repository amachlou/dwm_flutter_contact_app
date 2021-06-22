import 'package:dwm_flutter_contact_app/model/contact.model.dart';
import 'package:dwm_flutter_contact_app/model/message.model.dart';

abstract class MessageEvent<T>{
  T payload;
  MessageEvent(this.payload);
}

class MessagesByContacEvent extends MessageEvent<Contact>{
  MessagesByContacEvent(Contact contact) : super(contact);
}

class AddNewMessageEvent extends MessageEvent<Message>{
  AddNewMessageEvent(Message message) : super(message);
}

