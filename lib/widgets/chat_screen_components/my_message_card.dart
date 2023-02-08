import 'package:flutter/material.dart';

import '../../database/colors.dart';

class MyMessageCard extends StatelessWidget {
  final String myText;
  final String myMail;
  const MyMessageCard({
    super.key,
    required this.myText,
    required this.myMail,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 150),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: messageColor,
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
                    alignment: Alignment.topRight,
                    child: Text(myText, style: const TextStyle(fontSize: 16))),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(myMail,
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
