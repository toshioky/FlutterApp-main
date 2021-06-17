import 'package:flutter/cupertino.dart';
import 'package:smarting/model/Entry.dart';
import 'package:smarting/services/firestore_service.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:uuid/uuid.dart';

class EntryProvider with ChangeNotifier{
  final firestoreService = FirestoreService();

  late DateTime _date;
  late String _entry;
  late String _entryId;
  var uuid = Uuid();

  //Getters
  DateTime get date => _date;
  String get entry => _entry;
  Stream<List<Entry>> get entries => firestoreService.getListEntries();

  //Setters
  set changeDate(DateTime date){
    _date = date;
    notifyListeners();
  }

  set changeEntry(String entry) {
    _entry = entry;
    notifyListeners();
  }
  loadAll(Entry entry){
    // ignore: unnecessary_null_comparison
    if(entry != null){
      _date = DateTime.parse(entry.date);
      _entry = entry.entry;
      _entryId = entry.entryId;
    }else{
      _date = DateTime.now();
      // ignore: unnecessary_statements
      _entry;
      // ignore: unnecessary_statements
      _entryId;
    }
  }

  // 登録＆更新メソッド
  upsertEntry(){
    // ignore: unnecessary_null_comparison
    if(_entryId == null){
      // 登録
      var insertEntry = Entry(date: _date.toIso8601String(), entry: _entry, entryId: uuid.v1());
      firestoreService.upsertEntry(insertEntry);
    } else {
      // 更新
      var updateEntry = Entry(date: _date.toIso8601String(), entry: _entry, entryId: _entryId);
      firestoreService.upsertEntry(updateEntry);
    }
  }

  // 削除メソッド
  removeEntry(String entryId){
    firestoreService.removeEntry(entryId);
  }
}