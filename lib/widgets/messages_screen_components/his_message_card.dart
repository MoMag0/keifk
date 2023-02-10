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
    // we use this column to use crossAxixAlignment attribute
    return Column(
      // this attribute to make sender widget most left
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // to make the widget have maximum width with respect to screen size
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 200),
          child: Column(
            // a column contains two widgets ' sender email & its message '
            crossAxisAlignment: CrossAxisAlignment
                .start, // we make it most left as well <- why first alignment didnt work?
            children: [
              // ## sender email
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Text(
                  hisMail,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              // ## Sender message
              Card(
                elevation: 4,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(0)),
                ),
                color: senderMessageColor,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 15,
                    top: 10,
                    bottom: 15,
                  ),
                  child: Text(
                    hisText,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
