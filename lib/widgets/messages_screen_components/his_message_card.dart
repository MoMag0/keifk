import 'package:flutter/material.dart';

import '../../database/colors.dart';

class HisMessageCard extends StatelessWidget {
  String hisText;
  String hisMail;
  HisMessageCard({
    super.key,
    required this.hisText,
    required this.hisMail,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 150),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: senderMessageColor,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 30,
              top: 5,
              bottom: 20,
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(hisText, style: const TextStyle(fontSize: 16))),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(hisMail,
                      style:
                          const TextStyle(fontSize: 13, color: Colors.white60)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
