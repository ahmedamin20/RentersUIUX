import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotification
{
  FirebaseNotification._();
  static final FirebaseNotification instance = FirebaseNotification._();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
  }
  // get token user
  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }
  // subscribe to topic
  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }
  // unsubscribe from topic
  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }
  // on message
  Future<void> onMessage(void Function(Map<String, dynamic> message) onMessage) async {
    FirebaseMessaging.onMessage.listen((event) {
      onMessage(event.data);
    });
  }
  // Future<void> onMessageOpenedApp(void Function(Map<String, dynamic> message) onMessageOpenedApp) async {
  //   FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //     onMessageOpenedApp(event.data);
  //   });
  // }
  Future<void> onBackgroundMessage(void Function(Map<String, dynamic> message) onBackgroundMessage) async {
    FirebaseMessaging.onBackgroundMessage((message) async {
      onBackgroundMessage(message.data);
    });
  }


}