import 'package:dreamlendar/aMonth/a_month_screen.dart';
import 'package:dreamlendar/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class PagesView extends StatefulWidget {
  const PagesView({ Key? key }) : super(key: key);

  @override
  State<PagesView> createState() => _PagesViewState();
}

class _PagesViewState extends State<PagesView> {

  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: [
        WelcomeScreen(),
        A_MonthsScreen(),
      ],
    );
  }
}