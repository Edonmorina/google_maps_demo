import 'package:flutter/material.dart';

class PersonOnline extends StatelessWidget {
  const PersonOnline({
    Key? key,
    required this.photoUrl,
    required this.personName,
  }) : super(key: key);

  final String photoUrl;
  final String personName;

  final double containerSize = 60;
  final double dividerHeight = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: containerSize,
            width: containerSize,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent, width: 1.5),
                borderRadius: BorderRadius.circular(containerSize),
                color: const Color.fromARGB(255, 197, 196, 196)),
            child: Center(
                child: CircleAvatar(
              radius: containerSize / 2,
              backgroundImage: NetworkImage(photoUrl),
            )),
          ),
          SizedBox(
            height: dividerHeight,
          ),
          Center(
            child: Text(
              personName,
              style: const TextStyle(
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
