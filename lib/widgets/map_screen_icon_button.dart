import 'package:flutter/material.dart';

class MapScreenIconButton extends StatelessWidget {
  const MapScreenIconButton(
      {Key? key, required this.iconData, this.onTap, this.margin})
      : super(key: key);

  final IconData iconData;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(175, 0, 0, 0),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        margin: margin,
        height: 45,
        width: 45,
        child: Icon(
          iconData,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
