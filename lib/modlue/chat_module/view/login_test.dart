// import 'package:flutter/material.dart';
//
// import '../core/helper/cach_helper/cach_helper.dart';
// import 'pages/chat_screen/chat_screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController emailController = TextEditingController();
//
//   TextEditingController passwordController = TextEditingController();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     // int id = CacheHelper.get(key: 'id');
//     // PusherHelper.pusherHelper.subscribe('private-chat.$id');
//     // PusherHelper.pusherHelper.bind('MessageSentEvent', (event)
//     // {
//     //   print(event);
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const Text('Login Screen'),
//           ElevatedButton(
//               onPressed: () {
//                 CacheHelper.put(key: 'id', value: 45);
//                 CacheHelper.put(
//                     key: 'token',
//                     value: "169|dBc4uXuVxQVGyuiwSYKq0SF9vi6BOzOAy1v4iPLW");
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const ChatScreen(userID: ,
//                   userToken: ,
//                   )),
//                 );
//               },
//               child: const Text("user one")),
//           const SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 CacheHelper.put(key: 'id', value: 36);
//                 CacheHelper.put(
//                     key: 'token',
//                     value: "170|yxjWCBTWJh900u4QvAoxvtsEn0RNgmehBpqrnEZF");
//                 // email
//                 // CacheHelper.put(key: 'id', value: 38);
//                 // CacheHelper.put(key: 'token', value: "145|Icgt7YKjj4SkwkigtsS4KdSo9QCSbBRwSzENIaIw");
//
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const ChatScreen()),
//                 );
//               },
//               child: const Text("user two")),
//         ],
//       ),
//     );
//   }
// }
