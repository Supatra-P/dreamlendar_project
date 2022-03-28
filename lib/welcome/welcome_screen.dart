// ignore_for_file: deprecated_member_use

import 'package:dreamlendar/aMonth/a_month_screen.dart';
import 'package:dreamlendar/animate_slide_up.dart';
import 'package:dreamlendar/constants.dart';
import 'package:dreamlendar/services/theme_sevices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool click = true;

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
          // app navigation bar
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Container(
                  width: 32,
                  child: IconButton(
                    icon: Icon(
                      Icons.calendar_month,
                    ),
                    color: Theme.of(context).iconTheme.color?.withOpacity(0.75),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        click = !click;
                      });
                      ThemeService().switchTheme();
                    },
                    child: Icon(
                      (click == false)
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                      color:
                          Theme.of(context).iconTheme.color?.withOpacity(0.75),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      child: IconButton(
                        icon: Icon(
                          Icons.crop_original_rounded,
                          color: Theme.of(context)
                              .iconTheme
                              .color
                              ?.withOpacity(0.75),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_box_rounded,
                        color: Theme.of(context)
                            .iconTheme
                            .color
                            ?.withOpacity(0.75),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
            backgroundColor: kPrimaryColor.withAlpha(0),
          ),

          // Welcome to Dreamlendar
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 3,
              ),
              Text(
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

              Text(
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

              Text(
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

              Spacer(
                flex: 2,
              ),
              // slide up to open calendar button
              IconButton(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.login_rounded,
                  color: Theme.of(context).iconTheme.color?.withOpacity(0.75),
                  size: 36,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => A_MonthsScreen()),
                ),
              ),
              // AnimateSideUp(),  not yet use

              Spacer(
                flex: 1,
              ),
              // checklist button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding,
                    ),
                    child: SizedBox(
                      child: IconButton(
                        alignment: Alignment.centerRight,
                        icon: Icon(
                          Icons.checklist_rounded,
                          color: Theme.of(context)
                              .iconTheme
                              .color
                              ?.withOpacity(0.75),
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
}
