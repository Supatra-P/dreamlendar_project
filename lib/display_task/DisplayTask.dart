// ignore_for_file: deprecated_member_use

import 'package:dreamlendar/aMonth/a_month_screen.dart';
import 'package:dreamlendar/add_task/EventList.dart';
import 'package:dreamlendar/constants.dart';
import 'package:dreamlendar/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import '../models/task.dart';
import 'package:dreamlendar/controllers/task_controller.dart';

class DisplayTask extends StatefulWidget {
  final Task? task;
  DisplayTask(this.task);

  @override
  State<DisplayTask> createState() => _DisplayTaskState();
}

class _DisplayTaskState extends State<DisplayTask> {
  final _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "ACTIVITY DETAILS",
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.color
                    ?.withOpacity(1),
                fontSize: 18,
              ),
            ),
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Theme.of(context).iconTheme.color?.withOpacity(0.75),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventList()),
                ),
              ),
            ),
            backgroundColor: kPrimaryColor.withAlpha(0),
          ),
          body: ListView(children: [
            Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 20.0, right: 20, bottom: 20),
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 30,
                  bottom: 32,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).iconTheme.color?.withOpacity(0.54),
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task?.title ?? "",
                      style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.color
                            ?.withOpacity(1),
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      widget.task?.startDate ?? "",
                      style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.color
                            ?.withOpacity(1),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.task?.startTime ?? "",
                      style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.color
                            ?.withOpacity(1),
                        fontSize: 9,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Container(
                        width: 1.0,
                        color: _getBGClr(widget.task?.color ?? 0),
                      ),
                    ),
                    Text(
                      widget.task?.endDate ?? "",
                      style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.color
                            ?.withOpacity(1),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.task?.endTime ?? "",
                      style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.color
                            ?.withOpacity(1),
                        fontSize: 9,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Repeats",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.color
                                ?.withOpacity(1),
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          widget.task?.repeat ?? "",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.color
                                ?.withOpacity(1),
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Alert",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.color
                                ?.withOpacity(1),
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        // SizedBox(height: 16,),
                        Text(
                          "${widget.task?.alert} minutes before",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.color
                                ?.withOpacity(1),
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Show as",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.color
                                ?.withOpacity(1),
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          widget.task?.showAs ?? "",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.color
                                ?.withOpacity(1),
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      height: 230,
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        widget.task?.note ?? "",
                        style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.color
                                ?.withOpacity(1),
                            fontSize: 12),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(
                left: 32,
                top: 0,
                right: 32,
                bottom: 44,
              ),
              child: FlatButton(
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                color: Theme.of(context).iconTheme.color?.withOpacity(0.54),
                onPressed: () {
                  _taskController.delete(widget.task!);
                  Get.back();
                  _taskController.getTasks();
                },
                child: Text(
                  'DELETE THIS ACTIVITY',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ]),
        ),
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
