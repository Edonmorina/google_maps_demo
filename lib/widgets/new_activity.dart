import 'package:flutter/material.dart';
import 'package:map_demo/Utils/activity_type.dart';

class NewActivity extends StatelessWidget {
  const NewActivity({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.message,
    required this.activity,
    required this.minutes,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String message;
  final ActivityType activity;
  final int minutes;

  IconData _returnIconBasedOnActivity() {
    switch (activity) {
      case ActivityType.checkIn:
        return Icons.more_time_sharp;
      case ActivityType.message:
        return Icons.message_outlined;
      case ActivityType.report:
        return Icons.remove_red_eye_rounded;
      default:
        return Icons.question_mark_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 25),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 27.5,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    message,
                    maxLines: 2,
                    softWrap: true,
                    textWidthBasis: TextWidthBasis.parent,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              _returnIconBasedOnActivity(),
              size: 30,
            ),
            Text(
              '${minutes}m ago',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
