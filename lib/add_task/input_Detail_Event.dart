import 'package:dreamlendar/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dreamlendar/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color:
                  Theme.of(context).textTheme.headline1?.color?.withOpacity(1),
              fontSize: 14,
            ),
          ),
          Container(
            height: 64.0,
            // padding: EdgeInsets.only(
            //   top: 0.0,
            // ),
            // decoration: BoxDecoration(
            //     border: Border.all(color: Colors.white, width: 1.0),
            //     borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  cursorColor: Colors.white12,
                  controller: controller,
                  style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.color
                        ?.withOpacity(1),
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.color
                          ?.withOpacity(.54),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        color: kWhiteColor,
                      ),
                      gapPadding: 8.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        color: kWhiteColor,
                      ),
                      gapPadding: 8.0,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                  ),
                  autocorrect: false,
                ),
              ),
              widget == null ? Container() : Container(child: widget)
            ]),
          ),
        ],
      ),
    );
  }
}
