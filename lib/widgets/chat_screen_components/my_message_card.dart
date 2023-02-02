import 'package:flutter/material.dart';

import '../../database/colors.dart';

class MyMessageCard extends StatelessWidget {
  final String myText;
  final String myTime;
  const MyMessageCard({
    super.key,
    required this.myText,
    required this.myTime,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: messageColor,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 30,
                  top: 5,
                  bottom: 20,
                ),
                child: Text(myText, style: const TextStyle(fontSize: 16)),
              ),
              // position the time and check logo , in bottom right the message
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      myTime,
                      style:
                          const TextStyle(fontSize: 13, color: Colors.white60),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(Icons.done_all, size: 20)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
