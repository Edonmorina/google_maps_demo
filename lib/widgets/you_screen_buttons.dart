import 'package:flutter/material.dart';

class YouScreenButton extends StatelessWidget {
  const YouScreenButton({
    Key? key,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.fromLTRB(10, 7.5, 15, 7.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Icon(
                iconData,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.blue, fontSize: 12, letterSpacing: 0.5),
          )
        ],
      ),
    );
  }
}
