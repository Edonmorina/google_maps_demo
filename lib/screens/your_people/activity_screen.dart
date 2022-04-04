import 'package:flutter/material.dart';
import 'package:map_demo/Utils/activity_type.dart';
import 'package:map_demo/Widgets/new_activity.dart';
import 'package:map_demo/widgets/new_message.dart';
import 'package:map_demo/widgets/person_online.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                NewMessage(),
                PersonOnline(
                  personName: 'Louise',
                  photoUrl:
                      'https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80',
                ),
                PersonOnline(
                  personName: 'Stephanie',
                  photoUrl:
                      'https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80',
                ),
                PersonOnline(
                  personName: 'Christopher',
                  photoUrl:
                      'https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80',
                ),
                PersonOnline(
                  personName: 'Louise',
                  photoUrl:
                      'https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80',
                ),
                PersonOnline(
                  personName: 'Louise',
                  photoUrl:
                      'https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80',
                ),
                PersonOnline(
                  personName: 'Louise',
                  photoUrl:
                      'https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80',
                ),
                PersonOnline(
                  personName: 'Louise',
                  photoUrl:
                      'https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80',
                ),
                PersonOnline(
                  personName: 'Louise',
                  photoUrl:
                      'https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80',
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 0,
          thickness: 0.25,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                NewActivity(
                    imageUrl:
                        "https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
                    title: "Christopher started a check-in",
                    message: "Called \"Night out bowling\" for 10pm",
                    activity: ActivityType.checkIn,
                    minutes: 3),
                NewActivity(
                    imageUrl:
                        "https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
                    title: "Stephanie sent a message",
                    message: "Hey, you coming over tonight?",
                    activity: ActivityType.message,
                    minutes: 2),
                NewActivity(
                    imageUrl:
                        "https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
                    title: "Louise posted a report",
                    message:
                        "Street lightning over on Beckel St isn't working, and it's aaaaaaaaaaaaaaaaaaaa",
                    activity: ActivityType.report,
                    minutes: 5),
                NewActivity(
                    imageUrl:
                        "https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
                    title: "Louise posted a report",
                    message:
                        "Street lightning over on Beckel St isn't working, and it's aaaaaaaaaaaaaaaaaaaa",
                    activity: ActivityType.report,
                    minutes: 5),
                NewActivity(
                    imageUrl:
                        "https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
                    title: "Louise posted a report",
                    message:
                        "Street lightning over on Beckel St isn't working, and it's aaaaaaaaaaaaaaaaaaaa",
                    activity: ActivityType.report,
                    minutes: 5),
                NewActivity(
                    imageUrl:
                        "https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
                    title: "Louise posted a report",
                    message:
                        "Street lightning over on Beckel St isn't working, and it's aaaaaaaaaaaaaaaaaaaa",
                    activity: ActivityType.report,
                    minutes: 5),
                NewActivity(
                    imageUrl:
                        "https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
                    title: "Louise posted a report",
                    message:
                        "Street lightning over on Beckel St isn't working, and it's aaaaaaaaaaaaaaaaaaaa",
                    activity: ActivityType.report,
                    minutes: 5),
                NewActivity(
                    imageUrl:
                        "https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
                    title: "Louise posted a report",
                    message:
                        "Street lightning over on Beckel St isn't working, and it's aaaaaaaaaaaaaaaaaaaa",
                    activity: ActivityType.report,
                    minutes: 5),
                NewActivity(
                    imageUrl:
                        "https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
                    title: "Louise posted a report",
                    message:
                        "Street lightning over on Beckel St isn't working, and it's aaaaaaaaaaaaaaaaaaaa",
                    activity: ActivityType.report,
                    minutes: 5),
                NewActivity(
                    imageUrl:
                        "https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
                    title: "Louise posted a report",
                    message:
                        "Street lightning over on Beckel St isn't working, and it's aaaaaaaaaaaaaaaaaaaa",
                    activity: ActivityType.report,
                    minutes: 5),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
