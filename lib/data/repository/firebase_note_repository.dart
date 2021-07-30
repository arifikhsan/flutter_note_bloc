import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_note_bloc/data/model/note_insert_model.dart';
import 'package:flutter_note_bloc/data/model/note_model.dart';
import 'package:flutter_note_bloc/data/repository/note_repository.dart';

class FirebaseNoteRepository implements NoteRepository {
  final noteCollection = FirebaseFirestore.instance.collection('notes');

  @override
  Stream<List<NoteModel>> notes() {
    return noteCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((document) {
        return NoteModel.fromDocumentSnapshot(document);
      }).toList();
    });
  }

  @override
  Future<void> insert(NoteInsertModel note) {
    return noteCollection.add(note.toDocument());
  }

  @override
  Future<void> update(NoteModel note) {
    return noteCollection.doc(note.id).update(note.toDocument());
  }

  @override
  Future<void> delete(NoteModel note) {
    return noteCollection.doc(note.id).delete();
  }
}
