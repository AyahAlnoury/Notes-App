import 'package:bloc/bloc.dart';
import 'package:note222/models/note_model.dart';
import 'package:note222/notes_cubit/note_state.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NoteInitialState());

  void addNote(String title, String content) {
    if (state is AddRemoveNoteState) {
      final preNotes = (state as AddRemoveNoteState).notes;

      final newNote =
          Note(title: title, content: content, createdAt: DateTime.now());
      List<Note> newList = List.from(preNotes)..add(newNote);

      emit(AddRemoveNoteState(newList));
    } else {
      emit(AddRemoveNoteState([]));
    }
  }

  void removeNote(int index) {
    final preNotes = (state as AddRemoveNoteState).notes;

    final List<Note> updatedNotes = List.from(preNotes)..removeAt(index);
    emit(AddRemoveNoteState(updatedNotes));
  }
}
