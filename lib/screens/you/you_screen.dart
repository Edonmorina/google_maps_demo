import 'package:flutter/material.dart';
import 'package:map_demo/screens/you/your_activity_screen.dart';
import 'package:map_demo/utils/global_variables.dart';
import 'package:map_demo/widgets/you_screen_buttons.dart';

class YouScreen extends StatefulWidget {
  const YouScreen({Key? key}) : super(key: key);

  @override
  State<YouScreen> createState() => _YouScreenState();
}

class _YouScreenState extends State<YouScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  //ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: YourActivity(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: kYouActivityAppBarHeight,
              width: double.infinity,
              color: Colors.white.withOpacity(0.625),
              padding: const EdgeInsets.only(right: 15),
              child: SafeArea(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      height: 50,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 230, 173, 3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80'),
                          ),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.menu))
                        ],
                      )),
                ),
              ),
            ),
          ),
          Positioned(
              left: 5,
              bottom: 10,
              child: Row(
                children: const [
                  YouScreenButton(title: "SOS", iconData: Icons.add_alert),
                  YouScreenButton(
                    title: "Add Check In",
                    iconData: Icons.add,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}





// SizedBox(
//                     height: 45,
//                     width: 45,
//                     child: CircleAvatar(
//                       backgroundImage: NetworkImage(
//                           'https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80'),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   )