import 'package:ksb/modlue/chat_module/core/constants/constants.dart';
import 'package:pusher_client/pusher_client.dart';

import '../../../../../core/caching_data/cacshing_date.dart';


class PusherHelper {
  late PusherClient pusher;

  PusherHelper._();

  // single Tone
  static PusherHelper pusherHelper = PusherHelper._();
  Channel? channel;
  Channel? channel2;
  Channel? channel3;

  Future<void> getPusherInit() async {
    PusherOptions options = PusherOptions(
      auth: PusherAuth(
        'https://rayed-api.ksbgarage.com/broadcasting/auth',
        headers: {

          'Authorization': 'Bearer ${CachingData.instance.getCachedLogin()!.data!.token}',
          // 'Content-Type': 'application/json',
        },
      ),
      // host: 'https://rayed-api.ksbgarage.com',
      cluster: 'eu',
      encrypted: true,
    );
    pusher = PusherClient('ac27eff7ae7693f1b7ae', options,
        enableLogging: true, autoConnect: true);
    await pusher.connect();

    pusher.onConnectionStateChange((state) {
      print(state!.currentState);
    });

    pusher.onConnectionError((error) {
      // ignore: avoid_print
      print("error: ${error!.message}");
    });
  }

  Future<void> subscribe(String channelName) async {
    channel = pusher.subscribe(channelName);
  }

  Future<void> subscribe2(String name) async {
    channel2 = pusher.subscribe(name);
  }

  Future<void> subscribe3(String name) async {
    channel3 = pusher.subscribe(name);
  }

  void bind2(String eventName, void Function(PusherEvent? event) onEvent) {
    channel2!.bind(eventName, onEvent);
  }

  void bind3(String eventName, void Function(PusherEvent? event) onEvent) {
    channel3!.bind(eventName, onEvent);
  }

  void bind(String eventName, void Function(PusherEvent? event) onEvent) {
    channel!.bind(eventName, onEvent);
  }

  void disconnect() {
    pusher.disconnect();
  }
}
