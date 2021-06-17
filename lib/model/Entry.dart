class Entry {
  final String entryId;
  final String date;
  final String entry;

  Entry({required this.entryId, required this.date, required this.entry});

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
        entryId: json['entryId'], date: json['date'], entry: json['entry']);
  }

  Map<String, dynamic> toMap() {
    return {'date': date, 'entry': entry, 'entryId': entryId};
  }
}
