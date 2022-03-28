// ignore_for_file: deprecated_member_use

import 'package:dreamlendar/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: buildAppBar(context),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 3,
              ),
              Center(
                child: Text(
                  "WELCOME",
                  style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.color
                        ?.withOpacity(1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "to",
                  style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.color
                        ?.withOpacity(1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "DREAMLENDAR",
                  style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.color
                        ?.withOpacity(1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Center(
                child: SizedBox(
                  // width: 64,
                  // height: 64,
                  child: IconButton(
                    alignment: Alignment.center,
                    icon: Icon(
                      Icons.calendar_view_day_rounded,
                      color:
                          Theme.of(context).iconTheme.color?.withOpacity(0.75),
                      size: 32,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    // width: 48,
                    // height: ,
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding,
                    ),
                    child: SizedBox(
                      // width: 64,
                      // height: 64,
                      child: IconButton(
                        alignment: Alignment.centerRight,
                        icon: Icon(
                          Icons.checklist_rounded,
                          color:
                              Theme.of(context).iconTheme.color?.withOpacity(0.75),
                          size: 32,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
            width: 32,
            child: IconButton(
              icon: Icon(Icons.calendar_month),
              color: kContentColorDark54Theme.withOpacity(1),
              onPressed: () {},
            ),
          ),
          IconButton(
            icon: Icon(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined),
            color: kContentColorDark54Theme.withOpacity(1),
            onPressed: () {},
          ),
          // GestureDetector(
          //   onTap: () {
          //     print("tapppeddd");
          //   },
          //   child: Icon(Icons.dark_mode_outlined,),
          // )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              Container(
                width: 32,
                child: IconButton(
                  icon: Icon(
                    Icons.insert_photo_sharp,
                    color: kContentColorDark54Theme.withOpacity(1),
                  ),
                  onPressed: () {},
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_box_rounded,
                  color: kContentColorDark54Theme.withOpacity(1),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
      backgroundColor: kPrimaryColor.withAlpha(0),
    );
  }
}
