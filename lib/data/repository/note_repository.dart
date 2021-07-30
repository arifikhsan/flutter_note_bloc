import 'package:flutter_note_bloc/data/model/note_insert_model.dart';
import 'package:flutter_note_bloc/data/model/note_model.dart';

abstract class NoteRepository {
  Stream<List<NoteModel>> notes();
  Future<void> insert(NoteInsertModel note);
  Future<void> update(NoteModel note);
  Future<void> delete(NoteModel note);
}
