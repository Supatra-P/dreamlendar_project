import 'dart:math';

import 'package:dreamlendar/constants.dart';
import 'package:dreamlendar/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/task.dart';

class TaskTile extends StatefulWidget {
  final Task? task;
  TaskTile(this.task);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      width: max(0, 334),
      padding:
          const EdgeInsets.only(left: 16, top: 16.0, right: 16, bottom: 16),
      margin: EdgeInsets.only(
        left: 28,
        right: 28,
        top: 8,
        // bottom: 8,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).iconTheme.color?.withOpacity(0.54),
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.task!.startDate}",
            style: TextStyle(
              fontSize: 18,
              color:
                  Theme.of(context).textTheme.headline1?.color?.withOpacity(1),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.task!.startTime}",
                    style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.color
                          ?.withOpacity(1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 1,
                      vertical: 1.5,
                    ),
                    height: 22,
                    width: 1.0,
                    color: _getBGClr(widget.task?.color ?? 0),
                  ),
                  Text(
                    "${widget.task!.endTime}",
                    style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.color
                          ?.withOpacity(1),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                ),
                width: max(0, 246),
                margin: const EdgeInsets.only(
                  bottom: 0,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: _getBGClr(widget.task?.color ?? 0),
                  ),
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.task?.title ?? "",
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.color
                                  ?.withOpacity(1)),
                        ),
                        SizedBox(
                          height: 0.5,
                        ),
                        Text(
                          widget.task?.note ?? "",
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.color
                                  ?.withOpacity(.75)),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return Color(widget.task?.codeSee ?? 0);
      case 1:
        return kPicker1;
      case 2:
        return kPicker2;
      case 3:
        return kPicker3;
      case 4:
        return kPicker4;
      default:
        return kPrimaryColor;
    }
  }
}
