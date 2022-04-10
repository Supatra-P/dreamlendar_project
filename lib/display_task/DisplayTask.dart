// ignore_for_file: deprecated_member_use

import 'package:dreamlendar/aMonth/a_month_screen.dart';
import 'package:dreamlendar/constants.dart';
import 'package:flutter/material.dart';

class DisplayTask extends StatefulWidget {
  const DisplayTask({Key? key}) : super(key: key);

  @override
  State<DisplayTask> createState() => _DisplayTaskState();
}

class _DisplayTaskState extends State<DisplayTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg1.jpg"),
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
            // centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Theme.of(context).iconTheme.color?.withOpacity(0.75),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => A_MonthsScreen()),
                ),
              ),
            ),
            actions: [
              // TextButton(
              //   child: Text("Edit"),
              //   style: TextButton.styleFrom(
              //     primary: kBlackColor
              //   ),
              //   onPressed: (){

              //   },
              // ),
              Container(
                padding: EdgeInsets.only(right: 32.0, top: 14.0, bottom: 15.0),
                child: TextButton(
                  // height: 24,
                  // padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0,),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(7),
                  // ),
                  // color: kWhiteColor.withOpacity(.54),
                  onPressed: () => A_MonthsScreen(),
                  child: Text(
                    'EDIT',
                    style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.color
                          ?.withOpacity(1),
                      fontSize: 10,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).iconTheme.color?.withOpacity(0.54),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
              ),
              //     TextButton(
              //     child: Row(
              //       children: [
              //         Container(
              //           decoration: BoxDecoration(
              //       color: Colors.white54,
              //       borderRadius: BorderRadius.all(Radius.circular(7)),
              // ),
              //           width: 30,
              //         ),
              //         TextButton(
              //             child: Text("Edit"),
              //             onPressed: () {
              //              //
              //             }),
              //       ],
              //     ),
              //     onPressed: (){},
              //   ),
            ],
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
                // child: Text(
                //   "SF231"
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SF231 Data Structures and Algorithms",
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
                      "Wednesday, 12 Jan 2022",
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
                      "01.30 pm",
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
                        color: kPrimaryColor, // <<<<---------
                      ),
                    ),
                    Text(
                      "01.30 pm",
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
                          "Every week",
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
                          "15 minutes before",
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
                    //
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Second alert",
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
                          "1 day before",
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
                          "Busy",
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
                      padding: EdgeInsets.only(left: 16),
                      height: 230,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextField(
                        style: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.color
                              ?.withOpacity(1),
                        ),
                        cursorColor: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.color
                            ?.withOpacity(1),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Notes..",
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ],
                )),
            // SizedBox(
            //   height: 5,
            // ),
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
                onPressed: () {},
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
}
