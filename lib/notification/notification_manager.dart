import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationManager {
  late FirebaseMessaging messaging;

  Future<void> _messageHandler(RemoteMessage message) async {
    print('background message ${message.notification!.body}');
  }

  Future<void> init() async {
    Firebase.initializeApp().whenComplete(() => {
          messaging = FirebaseMessaging.instance,
          messaging.getToken().then((value) {
            print("Firebase token --> $value");
          }),
          FirebaseMessaging.onBackgroundMessage(_messageHandler)
          // listenFirebaseMessage()
        });
  }

  void listenFirebaseMessage(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(event.notification!.title!),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }
}
