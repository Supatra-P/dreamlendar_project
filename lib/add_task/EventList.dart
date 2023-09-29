import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:dreamlendar/add_task/addEvent.dart';
import 'package:dreamlendar/add_task/task_tile.dart';
import 'package:dreamlendar/controllers/task_controller.dart';
import 'package:dreamlendar/display_task/DisplayTask.dart';
import 'package:dreamlendar/theme.dart';

import 'package:dreamlendar/welcome/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../constants.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Container(
      // Background
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg2.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            _addDateBar(),
            SizedBox(
              height: 8,
            ),
            _showTasks(),
          ],
        ),
      ),
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, index) {
              print(_taskController.taskList.length);
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                    child: FadeInAnimation(
                        child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                                DisplayTask(_taskController.taskList[index]));
                            print(_taskController
                                .taskList[index].id); //ดูidlistที่กดเข้าไป
                          },
                          child: TaskTile(_taskController.taskList[index]),
                        )
                      ],
                    )),
                  ));
            });
      }),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 0, left: 28, right: 28),
      padding: const EdgeInsets.only(left: 4, top: 8, right: 4, bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).iconTheme.color?.withOpacity(0.54),
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      child: DatePicker(
        DateTime.now().subtract(const Duration(days: 2)),
        height: 76,
        width: 59,
        initialSelectedDate: DateTime.now(),
        selectionColor: kPrimaryColor,
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
          fontSize: 18,
          color: Theme.of(context).textTheme.headline1?.color?.withOpacity(1),
        ),
        dayTextStyle: TextStyle(
          fontSize: 12,
          color: Theme.of(context).textTheme.headline1?.color?.withOpacity(1),
        ),
        monthTextStyle: TextStyle(
          fontSize: 0,
        ),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _appBar() {
    return AppBar(
      leading: Container(
        padding: const EdgeInsets.only(
          left: 16.0,
        ),
        child: IconButton(
          icon: Icon(Icons.home_sharp),
          color: Theme.of(context).iconTheme.color?.withOpacity(0.75),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            );
          },
        ),
      ),
      centerTitle: true,
      title: Text(
        DateFormat.MMMM().format(DateTime.now()).toUpperCase(),
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1?.color?.withOpacity(1),
          fontSize: 18,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: Icon(
              Icons.add_box_rounded,
              color: Theme.of(context).iconTheme.color?.withOpacity(0.75),
            ),
            onPressed: () async {
              await Get.to(() => addEventBar());
              _taskController.getTasks();
            },
          ),
        ),
      ],
      backgroundColor: kPrimaryColor.withAlpha(0),
    );
  }
}
