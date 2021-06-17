import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smarting/model/Entry.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  // エントリーリスト
  Stream<List<Entry>> getListEntries() {
    return _db
        .collection('entries')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Entry.fromJson(doc.data()))
        .toList());
  }

  // 登録＆更新サービス
  Future<void> upsertEntry(Entry entry) {
    var options = SetOptions(merge: true);

    return _db
        .collection('entries')
        .doc(entry.entryId)
        .set(entry.toMap(), options);
  }

  // 削除サービス
  Future<void> removeEntry(String entryId){
    return _db
        .collection('entries')
        .doc(entryId)
        .delete();
  }

}