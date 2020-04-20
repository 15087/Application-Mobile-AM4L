import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();

//const db = admin.firestore();
const fcm = admin.messaging();
export const sendToTopicEurope = functions
  .region("europe-west3")
  .firestore.document("notices/{noticeId}")
  .onCreate(async (snapshot) => {
    const notice = snapshot.data();
    // Deploy not working if no if else statement
    if (notice !== undefined) {
      notice.classes.forEach((clas: any) => {
        const payload: admin.messaging.MessagingPayload = {
          notification: {
            title: `${clas} : ${notice.title}`,
            body: `${notice.body}`,
            icon: "your-icon-url",
            click_action: "FLUTTER_NOTIFICATION_CLICK", // required only for onResume or onLaunch callbacks
          },
        };
        fcm.sendToTopic(String(clas), payload);
      });
      return "Notifications sent";
    } else {
      const payload: admin.messaging.MessagingPayload = {
        notification: {
          title: "Notification error",
          body: "Notification Error message",
          icon: "your-icon-url",
          click_action: "FLUTTER_NOTIFICATION_CLICK",
        },
      };
      return fcm.sendToTopic("errors", payload);
    }
  });
