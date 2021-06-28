import 'package:dwm_flutter_contact_app/bloc/contact/contacts.actions.dart';
import 'package:dwm_flutter_contact_app/bloc/contact/contacts.bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/contact/contacts.state.dart';
import 'package:dwm_flutter_contact_app/bloc/message/message.bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/message/message.state.dart';
import 'package:dwm_flutter_contact_app/enums/request.state.bloc.dart';
import 'package:dwm_flutter_contact_app/ui/pages/messages/widgets/message.form.widget.dart';
import 'package:dwm_flutter_contact_app/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:dwm_flutter_contact_app/ui/shared/error.retry.action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsWithMessages extends StatelessWidget {
  const ContactsWithMessages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ContactsBloc>().add(new LoadAllContacsEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts with messages'),
      ),
      body: BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
        if (state.requestState == RequestState.LOADING) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.requestState == RequestState.ERROR) {
          return ErrorRetryMessage();
        } else if (state.requestState == RequestState.LOADED) {
          return Column(children: [
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(15),
                  width: 100,
                  child: Column(children: [
                    CircleAvatar(
                      child: Text('$state.contacts[index].profile'),
                    ),
                    Text('${state.contacts[index].name}'),
                    Text('${state.contacts[index].score}'),
                  ]),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black12)),
                ),
                itemCount: state.contacts.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Expanded(
              child: BlocBuilder<MessageBloc, MessageState>(
                builder: (context, state) {
                  if (state.requestState == RequestState.LOADING) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.requestState == RequestState.ERROR) {
                    return ErrorRetryMessage(
                        errorMessage: state.errorMessage,
                        onAction: () {
                          context.read<MessageBloc>().add(state.currentEvent);
                        });
                  } else if (state.requestState == RequestState.LOADED) {
                    return MessagesList(state.messages);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            BlocBuilder<ContactsBloc, ContactsState>(
              builder: (context, state) => MessagesForm(state.currentContact),
            ),
          ]);
        } else {
          return Container();
        }
      }),
    );
  }
}
