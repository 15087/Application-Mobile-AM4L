import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  void subscribe(String topicUid) {
    _fcm.subscribeToTopic(topicUid);
  }

  void unsubscribe(String topicUid) {
    _fcm.unsubscribeFromTopic(topicUid);
  }

  void subscribeToList(List<String> topics) {
    for (var topic in topics) {
      try {
        subscribe(topic);
        print("Subscribe");
      } catch (e) {
        print(e.toString());
        print("Subscribe Error");
        return null;
      }
    }
  }

  void unsubscribeFromList(List<String> topics) {
    for (var topic in topics) {
      try {
        unsubscribe(topic);
        print("Unsubscribe");
      } catch (e) {
        print(e.toString());
        print("Unsubscribe Error");
        return null;
      }
    }
  }

  void unsubscribeFromSet(Set<String> topics) {
    for (var topic in topics) {
      try {
        unsubscribe(topic);
        print("Unsubscribe");
      } catch (e) {
        print(e.toString());
        print("Unsubscribe Error");
        return null;
      }
    }
  }
}
