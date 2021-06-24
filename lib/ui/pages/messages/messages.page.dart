import 'package:dwm_flutter_contact_app/bloc/message/message.actions.dart';
import 'package:dwm_flutter_contact_app/bloc/message/message.bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/message/message.state.dart';
import 'package:dwm_flutter_contact_app/enums/request.state.bloc.dart';
import 'package:dwm_flutter_contact_app/model/contact.model.dart';
import 'package:dwm_flutter_contact_app/ui/pages/contacts/widgets/contact.info.widget.dart';
import 'package:dwm_flutter_contact_app/ui/pages/messages/widgets/message.form.widget.dart';
import 'package:dwm_flutter_contact_app/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:dwm_flutter_contact_app/ui/shared/error.retry.action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesPage extends StatelessWidget {
  // const MessagesPage({required Key key}) : super(key: key);
  Contact contact;

  @override
  Widget build(BuildContext context) {
    context.read<MessageBloc>().add(MessagesByContacEvent(this.contact));

    // if(ModalRoute.of(context) != null){
      this.contact = ModalRoute.of(context).settings.arguments as Contact;
    // }

    return Scaffold(
      appBar: AppBar(
        // title: Text('${contact.name}\'s messages'),
      ),
      body: Column(
        children: [
          ContactInfoWidget(contact),
          Expanded(
            child: BlocBuilder<MessageBloc, MessageState>(
              builder: (context, state){
                if(state.requestState == RequestState.LOADING){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if(state.requestState == RequestState.ERROR){
                  return ErrorRetryMessage(errorMessage: state.errorMessage, onAction: (){
                    context.read<MessageBloc>().add(state.currentEvent);
                  });
                } else if(state.requestState == RequestState.LOADED){
                  return MessagesList(state.messages);
                } else{
                  return Container();
                }
              },
            ),
          ),
          MessagesForm(contact),
        ],
      ),
    );
  }
}
