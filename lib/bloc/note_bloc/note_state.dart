part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitialState extends NoteState {}
class NotesLoadFailure extends NoteState {}
class NotesLoadSuccess extends NoteState {
  final List<NoteModel> notes;

  NotesLoadSuccess(this.notes);
}
class NotesLoadStream extends NoteState {
  final Stream<List<NoteModel>> notes;

  NotesLoadStream(this.notes);
}
