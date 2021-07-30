part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class LoadNotesEvent extends NoteEvent {}
class NotesLoadedEvent extends NoteEvent {
  final List<NoteModel> notes;

  const NotesLoadedEvent(this.notes);
}

class AddNoteEvent extends NoteEvent {
  final NoteInsertModel note;

  const AddNoteEvent(this.note);
}

class UpdateNoteEvent extends NoteEvent {
  final NoteModel note;

  const UpdateNoteEvent(this.note);
}

class DeleteNoteEvent extends NoteEvent {
  final NoteModel note;

  const DeleteNoteEvent(this.note);
}
