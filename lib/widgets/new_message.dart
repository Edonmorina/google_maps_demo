import 'package:flutter/material.dart';

class NewMessage extends StatelessWidget {
  const NewMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: const Color.fromARGB(255, 237, 236, 236)),
            child: const Center(
              child: Icon(
                Icons.message,
                size: 35,
                color: Color.fromARGB(255, 129, 128, 128),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Center(
            child: Text(
              "New Message",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
