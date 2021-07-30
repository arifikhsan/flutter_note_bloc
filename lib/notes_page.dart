import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_bloc/bloc/note_bloc/note_bloc.dart';
import 'package:flutter_note_bloc/data/model/note_insert_model.dart';
import 'package:flutter_note_bloc/data/model/note_model.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NoteInitialState) {
            return Text('init');
          } else if (state is NotesLoadFailure) {
            return Text('fail');
          } else if (state is NotesLoadSuccess) {
            final notes = state.notes;

            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];

                return ListTile(
                  title: Text(note.note),
                  subtitle: Text(note.id),
                );
              },
            );
          } else if (state is NotesLoadStream) {
            return StreamBuilder(
              stream: state.notes,
              initialData: [],
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Text('loading');
                } else if (snapshot.hasError) {
                  return Text('error');
                } else if (snapshot.hasData) {
                  final List<NoteModel> notes = snapshot.data;

                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];

                      return ListTile(
                        title: Text(note.note),
                        subtitle: Text(note.id),
                      );
                    },
                  );
                } else {
                  return Text('else');
                }
              },
            );
          } else {
            return Text('else');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<NoteBloc>(context).add(
            AddNoteEvent(NoteInsertModel(note: 'note')),
          );
          BlocProvider.of<NoteBloc>(context).add(LoadNotesEvent());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
