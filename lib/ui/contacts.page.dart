import 'package:dwm_flutter_contact_app/bloc/contacts.actions.dart';
import 'package:dwm_flutter_contact_app/bloc/contacts.bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/contacts.state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts'),),
      body: Column(
        children: [
          Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(onPressed: () => {
                  context.read<ContactsBloc>().add(LoadAllContacsEvent())
                }, child: Text('All Contacts', style: TextStyle(color: Colors.white)), color: Colors.amber,),
                RaisedButton(onPressed: () => {
                  context.read<ContactsBloc>().add(LoadStudentsEvent())
                }, child: Text('Students', style: TextStyle(color: Colors.white)), color: Colors.cyan,),
                RaisedButton(onPressed: () => {
                  context.read<ContactsBloc>().add(LoadDevelopersEvent())
                }, child: Text('Developers', style: TextStyle(color: Colors.white)), color: Colors.blue,),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state){
              if(state.requestState == RequestState.LOADING){
                return Center(child: CircularProgressIndicator());
              } else if(state.requestState == RequestState.ERROR){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${state.errorMessage}"),
                    RaisedButton(onPressed: () => {
                      context.read<ContactsBloc>().add(state.currentEvent),
                    }, child: Text('Retry', style: TextStyle(color: Colors.white),), color: Colors.greenAccent,)
                  ],
                );
              } else if(state.requestState == RequestState.LOADED){
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              CircleAvatar(child: Text('${state.contacts[index].profile}'),),
                              SizedBox(width: 15,),
                              Text("${state.contacts[index].name}"),
                            ],),
                            CircleAvatar(child: Text('${state.contacts[index].score}'),),
                            // Text("${state.contacts[index].name}"),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Container();
              }
            }),
          )
        ],
      )
    );
  }
}
