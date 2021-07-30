class NoteInsertModel {
  final String note;

  NoteInsertModel({required this.note});

  Map<String, Object> toDocument() {
    return {
      'note': note,
    };
  }
}
