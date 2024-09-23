import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note222/notes_cubit/note_cubit.dart';
import 'package:note222/notes_cubit/note_state.dart';
import 'package:note222/widgets/note_item.dart';

class NoteAppWithoutStateManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    addNottte(String title, String content) {
      context.read<NotesCubit>().addNote(title, content);
    }

    void _showAddNoteDialog() {
      final _titleController = TextEditingController();
      final _contentController = TextEditingController();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Add New Note"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: "Content"),
                maxLines: 4,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                addNottte(_titleController.text, _contentController.text);
                print(_titleController.text);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Notes'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: BlocBuilder<NotesCubit, NoteState>(builder: (context, state) {
          if (state is NoteInitialState) {
            return const Center(child: Text('No Notes Available'));
          } else if (state is AddRemoveNoteState) {
            return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: state.notes.length,
                itemBuilder: (context, index) {
                  final note = state.notes[index];
                  return NoteItem(
                    title: note.title,
                    content: note.content,
                    onDelete: () {
                      return context.read<NotesCubit>().removeNote(index);
                    },
                  );
                });
          }
          return Text('sdfghjk');
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddNoteDialog,
          backgroundColor: Colors.blueGrey,
          child: const Icon(Icons.add),
        ));
  }
}
