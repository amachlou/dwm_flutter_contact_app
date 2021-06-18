import 'package:dwm_flutter_contact_app/bloc/contacts.bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/contacts.state.dart';
import 'package:dwm_flutter_contact_app/model/contact.model.dart';
import 'package:dwm_flutter_contact_app/repositories/contacts.repository.dart';
import 'package:dwm_flutter_contact_app/ui/contacts.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactsBloc(
          initialState: ContactsState(
              contacts: [], errorMessage: '', requestState: RequestState.NONE
          ),
          contactsRepository: new ContactsRepository(),),)
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.cyan),
        routes: {
          '/contacts': (context) => ContactPage()
        },
        initialRoute: '/contacts',
      ),
    );
  }
}
