import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String id;
  final String note;

  NoteModel({
    required this.id,
    required this.note,
  });

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'note': note,
    };
  }

  static NoteModel fromDocumentSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map;
    return NoteModel(
      id: document.id,
      note: data['note'],
    );
  }
}
