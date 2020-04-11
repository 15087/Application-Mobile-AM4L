import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

//collection reference
final CollectionReference noticeCollection = Firestore.instance.collection('notices');

}