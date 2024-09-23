import 'package:note222/models/note_model.dart';

abstract class NoteState {}

class NoteInitialState extends NoteState {}

class AddRemoveNoteState extends NoteState {
  List<Note> notes = [];
  AddRemoveNoteState(this.notes);
}
