import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomChat extends StatelessWidget
{
  const CustomChat(
      {super.key,
      required this.name,
      required this.lastMessage,
      required this.time,
      required this.image,
      required this.onTap,
      required this.unSeenMessage,
      required this.isOnline,
      required this.deleteChatFunctionFromall,
      required this.deleteChatFunctionFromMe});

  final String name;

  final String lastMessage;
  final String time;
  final String image;
  final Function onTap;
  final int unSeenMessage;
  final bool isOnline;

  final Function deleteChatFunctionFromMe;
  final Function deleteChatFunctionFromall;

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: ObjectKey(name),
      trailingActions: [
        SwipeAction(
            title: "Delete",
            onTap: (handler) async {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                        "Are you sure you want to delete this message?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                      TextButton(
                        onPressed: () {
                          deleteChatFunctionFromMe();
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(primary: Colors.red),
                        child: const Text("Delete Message from me"),
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     deleteChatFunctionFromall();
                      //     Navigator.pop(context);
                      //   },
                      //   style: TextButton.styleFrom(primary: Colors.red),
                      //   child: const Text("Delete Chat from all"),
                      // ),
                    ],
                  );
                },
              );
              // handler(true);
              // onTap();
            },
            color: Colors.red,
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            )),
      ],
      child: ListTile(
        onTap: () {
          onTap();
        },
        leading: InkWell(
          onSecondaryTap: () {
            // showDialog(context: context,
            //     builder: (context) =>
            //         AlertDialog(
            //           content: Image.network(image),
            //         ));
          },
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Image.network(image),
                    ));
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  width: 55,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                top: -3,
                right: -3,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: isOnline ? Colors.green : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(lastMessage,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xffADB5BD))),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(timeago.format(DateTime.parse(time)),
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Color(0xffA4A4A4))),
            const SizedBox(
              height: 5,
            ),
            if (unSeenMessage != 0)
              Container(
                width: 40,
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffD2D5F9),
                ),
                child: Center(
                    child: Text(
                  unSeenMessage.toString(),
                  style: const TextStyle(color: Color(0xff001A83)),
                )),
              ),
          ],
        ),
      ),
    );
  }
}
