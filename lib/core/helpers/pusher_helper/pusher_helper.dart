import 'package:ksb/core/caching_data/cacshing_date.dart';
// import 'package:pusher_client/pusher_client.dart';


class PusherHelper
{
  // late PusherClient pusher;

  PusherHelper._();

  // single Tone
  static PusherHelper pusherHelper = PusherHelper._();
  // Channel? channel;


  // Future<void> getPusherInit() async {
  //   PusherOptions options = PusherOptions(
  //     auth: PusherAuth(
  //       'https://api.ksbgarage.com/broadcasting/auth',
  //       headers: {
  //         'Authorization': 'Bearer '
  //             '${CachingData.instance.getCachedLogin()?.data?.token ?? ""}',
  //         // 'Content-Type': 'application/json',
  //       },
  //     ),
  //     host: 'https://api.ksbgarage.com',
  //     cluster: 'eu',
  //     encrypted: true,
  //   );
  //   pusher = PusherClient('10017e3684530357631f', options,
  //       enableLogging: true, autoConnect: true);
  //   await pusher.connect();
  //
  //   pusher.onConnectionStateChange((state) {
  //     print(state!.currentState);
  //   });
  //
  //   pusher.onConnectionError((error) {
  //     // ignore: avoid_print
  //     print("error: ${error!.message}");
  //   });
  // }
  //
  // Future<void> subscribe(String channelName) async {
  //   channel = pusher.subscribe(channelName);
  // }
  //
  // void bind(String eventName, void Function(PusherEvent? event) onEvent) {
  //   channel!.bind(eventName, onEvent);
  // }
  //
  // void disconnect() {
  //   pusher.disconnect();
  // }
}
