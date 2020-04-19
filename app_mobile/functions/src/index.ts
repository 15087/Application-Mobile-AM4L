import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();

const db = admin.firestore();
const fcm = admin.messaging();

export const sendToTopic = functions.firestore
  .document("notices/{noticeId}")
  .onCreate(async (snapshot) => {
    const notice = snapshot.data();

    const payload: admin.messaging.MessagingPayload = {
      notification: {
        title: `New Notice : ${notice.title}`,
        body: `${notice.body}`,
        icon: "your-icon-url",
        click_action: "FLUTTER_NOTIFICATION_CLICK",
      },
    };

    // FIXME: Change "notices" topic's name to make a for loop in the notice "class" list
    return fcm.sendToTopic("notices", payload);
  });
