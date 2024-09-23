import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note222/notes_cubit/note_cubit.dart';
import 'note_app.dart';

void main() => runApp(MaterialApp(
      home: BlocProvider(
        create: (context) => NotesCubit(),
        child: NoteAppWithoutStateManagement(),
      ),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    ));
