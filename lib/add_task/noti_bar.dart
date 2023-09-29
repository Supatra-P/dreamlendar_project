import 'package:dreamlendar/constants.dart';
import 'package:flutter/material.dart';

class NotiBar extends StatelessWidget {
  final String title;
  final String fill;
  final Widget? widget;
  const NotiBar({
    Key? key,
    required this.title,
    required this.fill,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).textTheme.headline1?.color?.withOpacity(1),
            fontSize: 12,
          ),
        ),
        Expanded(
          child: Text(
            fill,
            style: TextStyle(
              color:
                  Theme.of(context).textTheme.headline1?.color?.withOpacity(1),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        widget == null ? Container() : Container(child: widget)
      ],
    );
  }
}
