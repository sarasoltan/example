import 'package:example/constants/routes.dart';
import 'package:example/services/auth/auth_service.dart';
import 'package:example/views/login_view.dart';
import 'package:example/views/notes/new_note_view.dart';
import 'package:example/views/notes/notes_view.dart';
import 'package:example/views/verify_email_view.dart';
import 'package:flutter/material.dart';
import 'package:example/views/register_view.dart';
import 'dart:developer' as devtools show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const NotesView(),
      verifyEmailRoute: (context) => const VerifyEmailView(),
      newNoteRoute: (context) => const NewNoteView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialze(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const NotesView();
              } else {
                return VerifyEmailView();
              }
            } else {
              return LoginView();
            }

          default:
            return CircularProgressIndicator();
        }
      },
    );
  }
}
