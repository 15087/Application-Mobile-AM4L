import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  Future initialise() async {
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

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
}
