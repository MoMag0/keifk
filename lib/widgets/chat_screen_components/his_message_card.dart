import 'package:flutter/material.dart';

import '../../database/colors.dart';

class HisMessageCard extends StatelessWidget {
  final String hisText;
  final String hisTime;
  const HisMessageCard({
    super.key,
    required this.hisText,
    required this.hisTime,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: senderMessageColor,
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
                child: Text(hisText, style: const TextStyle(fontSize: 16)),
              ),
              // position the time and check logo , in bottom right the message
              Positioned(
                bottom: 2,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      hisTime,
                      style:
                          const TextStyle(fontSize: 13, color: appBarColor),
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
