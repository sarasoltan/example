import 'package:flutter/material.dart';

class NewNoteView extends StatelessWidget {
  const NewNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("new note"),
      ),
      body: const Text("Write your text here..."),
    );
  }
}
