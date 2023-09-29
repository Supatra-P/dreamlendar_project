// ignore_for_file: deprecated_member_use

import 'package:dreamlendar/add_task/EventList.dart';
import 'package:dreamlendar/add_task/addEvent.dart';
import 'package:dreamlendar/constants.dart';
import 'package:dreamlendar/controllers/task_controller.dart';
import 'package:dreamlendar/models/task.dart';
import 'package:dreamlendar/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class A_MonthsScreen extends StatefulWidget {
  @override
  State<A_MonthsScreen> createState() => _A_MonthsScreenState();
}

class _A_MonthsScreenState extends State<A_MonthsScreen> {
  final TaskController _taskController = Get.put(TaskController());
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
            automaticallyImplyLeading: false,
            title: Container(
              width: 32,
              child: IconButton(
                icon: Icon(Icons.home_sharp),
                color: Theme.of(context).iconTheme.color?.withOpacity(0.75),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add_box_rounded,
                        color: Theme.of(context)
                            .iconTheme
                            .color
                            ?.withOpacity(0.75),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => addEventBar(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            backgroundColor: Colors.white.withAlpha(0),
          ),
          body: Container(
            // Background
            padding: EdgeInsets.only(
                left: 25.0, top: 28.0, right: 25.0, bottom: 48.0),
            margin: EdgeInsets.only(
                left: 32.0, top: 32.0, right: 32.0, bottom: 8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).iconTheme.color?.withOpacity(0.54),
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            child: ScrollableCleanCalendar(
              calendarController: CleanCalendarController(
                minDate: DateTime.now(),
                maxDate: DateTime.now().add(const Duration(days: 365)),
                // onRangeSelected: (firstDate, secondDate) {},
                rangeMode: false,
                onDayTapped: (date) {
                  _taskController.getTasks();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventList(),
                    ),
                  );
                },

                // readOnly: false,
                // onPreviousMinDateTapped: null,
                // onAfterMaxDateTapped: null,
                weekdayStart: DateTime.sunday,
                initialDateSelected: DateTime.now(),
                // endDateSelected: DateTime(2022, 3, 15),
              ),
              layout: Layout.BEAUTY,
              monthTextAlign: TextAlign.left,
              monthTextStyle: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.color
                    ?.withOpacity(1),
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
              weekdayTextStyle: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.color
                    ?.withOpacity(1),
              ),
              dayRadius: 16,
              calendarCrossAxisSpacing: 0,
              spaceBetweenMonthAndCalendar: 8,
              spaceBetweenCalendars: 64,
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 100,
          ),
        ),
      ),
    );
  }
}
