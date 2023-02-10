import 'package:flutter/material.dart';

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
    // we use this column to use crossAxixAlignment attribute
    return Column(
      // this attribute to make sender widget most left
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // to make the widget have maximum width with respect to screen size
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 200),
          child: Column(
            // a column contains two widgets ' my email & my message '
            crossAxisAlignment: CrossAxisAlignment
                .end, // we make it most right as well <- why first alignment didnt work?
            children: [
              // ## my email
              Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 10),
                child: Text(
                  myMail,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              // ## My message
              Card(
                elevation: 4,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(20)),
                ),
                color: const Color.fromARGB(255, 67, 33, 21),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 10,
                    top: 10,
                    bottom: 15,
                  ),
                  child: Text(
                    myText,
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
