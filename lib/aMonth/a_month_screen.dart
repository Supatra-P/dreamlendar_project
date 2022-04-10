// ignore_for_file: deprecated_member_use

import 'package:dreamlendar/constants.dart';
import 'package:dreamlendar/display_task/DisplayTask.dart';
import 'package:dreamlendar/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class A_MonthsScreen extends StatefulWidget {
  const A_MonthsScreen({Key? key}) : super(key: key);

  @override
  State<A_MonthsScreen> createState() => _A_MonthsScreenState();
}

class _A_MonthsScreenState extends State<A_MonthsScreen> {

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
                        MaterialPageRoute(builder: (context) => DisplayTask()),
                      ),
                    ),

                    // Container(
                    //   // margin: EdgeInsets.symmetric(horizontal: 10.0),
                    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //   child: FlatButton(
                    //     padding: EdgeInsets.symmetric(vertical: 8.0),
                    //     height: 24,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(7),
                    //     ),
                    //     color: kWhiteColor.withOpacity(.54),
                    //     onPressed: () => WelcomeScreen(),
                    //     child: Text(
                    //       'EDIT',
                    //       style: TextStyle(
                    //         color: kBlackColor,
                    //         fontSize: 12,
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
                left: 32.0, top: 16.0, right: 32.0, bottom: 8.0),
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
                onDayTapped: (date) => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                ),
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
          bottomNavigationBar: Container(
            child: SingleChildScrollView(
                child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 32.0,
                        top: 12.0,
                      ),
                      child: Text(
                        "TO DO",
                        style: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.color
                              ?.withOpacity(1),
                          fontSize: 21,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 28.0, bottom: 44.0, right: 28.0),
                  child: SizedBox(
                    height: 110,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        // height: 150,
                        // width: 90,
                        margin: EdgeInsets.all(7.0),
                        child: Row(
                          children: [
                            TextButton(
                              child: Text(
                                "$index            \n\n           $index",
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 20.0,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    kPrimaryColor), // drop color <<<<-------------------------------
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        color: kPrimaryColor.withOpacity(0.0),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
