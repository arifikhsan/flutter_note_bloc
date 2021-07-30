import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_note_bloc/data/model/note_insert_model.dart';
import 'package:flutter_note_bloc/data/model/note_model.dart';
import 'package:flutter_note_bloc/data/repository/firebase_note_repository.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc({
    required repository,
  })  : _repository = repository,
        super(NoteInitialState());

  final FirebaseNoteRepository _repository;
  StreamSubscription? _notesSubscription;

  @override
  Stream<NoteState> mapEventToState(
    NoteEvent event,
  ) async* {
    if (event is LoadNotesEvent) {
      await _notesSubscription?.cancel();
      // _notesSubscription =
      //     _repository.notes().listen((notes) => add(NotesLoadedEvent(notes)));
      // _notesSubscription = _repository.notes().listen((event));
      yield NotesLoadStream(_repository.notes());
    } else if (event is AddNoteEvent) {
      _repository.insert(event.note);
    } else if (event is UpdateNoteEvent) {
      _repository.update(event.note);
    } else if (event is DeleteNoteEvent) {
      _repository.delete(event.note);
    } else if (event is NotesLoadedEvent) {
      yield NotesLoadSuccess(event.notes);
    }
  }

  @override
  Future<void> close() async {
    await _notesSubscription?.cancel();
    return super.close();
  }
}
