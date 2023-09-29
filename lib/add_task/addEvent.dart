import 'package:dreamlendar/add_task/EventList.dart';
import 'package:dreamlendar/add_task/input_Detail_Event.dart';
import 'package:dreamlendar/add_task/noti_bar.dart';
import 'package:dreamlendar/controllers/task_controller.dart';
import 'package:dreamlendar/models/task.dart';
import 'package:dreamlendar/constants.dart';
import 'package:dreamlendar/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class addEventBar extends StatefulWidget {
  const addEventBar({Key? key}) : super(key: key);

  @override
  State<addEventBar> createState() => _addEventBarState();
}

// late final int year, month, day, hour, minute;
class _addEventBarState extends State<addEventBar> {
  bool _click = true;
  bool _switchButton = false;
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  // final moonLanding = DateTime.utc(year, month, day, hour, minute);
  String _startTime = DateFormat('hh:mm a').format(DateTime.now());
  String _endTime = "9:00 PM";
  String _showStartTime = DateFormat('hh:mm a').format(DateTime.now());
  String _showEndTime = "9:00 PM";
  int _selectedAlert = 5;
  List<int> alertList = [5, 10, 15, 30];
  int _selectedSecondAlert = 1;
  List<int> secondAlertList = [1, 2, 7, 14, 30];
  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];
  String _selectedShowAs = "Busy";
  List<String> showAsList = ["Busy", "Free"];
  int _selectedColor = 0;
  int _colorCode = 0;
  Color chooseColor = kPrimaryColor;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime;
    final _selectedStartDate = dateRange.start;
    final _selectedEndDate = dateRange.end;
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
            leadingWidth: 72.0,
            iconTheme: IconThemeData(
              color: Theme.of(context).iconTheme.color?.withOpacity(0.75),
            ),
            title: Text(
              'NEW ACTIVITY',
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.color
                    ?.withOpacity(1),
                fontSize: 18,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(right: 8.0, top: 14.0, bottom: 15.0),
                      child: TextButton(
                        onPressed: () => _validateDate(),
                        child: Text(
                          'DONE',
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
                            Theme.of(context)
                                .iconTheme
                                .color
                                ?.withOpacity(0.54),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            backgroundColor: kPrimaryColor.withAlpha(0),
          ),
          body: Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Title
                    MyInputField(
                      title: "TITLE",
                      hint: "Title",
                      // heights: 64.0,
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    //SwitchButton ALL DAY
                    SwitchListTile(
                      dense: true,
                      title: Text(
                        "ALL DAY",
                        style: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.color
                              ?.withOpacity(1),
                          fontSize: 14,
                          // height: -0.5,
                        ),
                      ),
                      value: _switchButton,
                      activeColor: kPrimaryColor,
                      onChanged: (bool value) {
                        setState(() {
                          _switchButton = value;
                          if (value == true) {
                            _selectAllDay();
                          } else {
                            _showStartTime =
                                DateFormat('hh:mm a').format(DateTime.now());
                            _showEndTime = _showStartTime;
                          }
                        });
                      },
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text("START",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.color
                                      ?.withOpacity(1),
                                  fontSize: 12,
                                ))
                          ],
                        ),
                        Container(
                          width: 90,
                        ),
                        Column(
                          children: [
                            Text("END",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.color
                                      ?.withOpacity(1),
                                  fontSize: 12,
                                ))
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    //Date
                    Container(
                      height: 28,
                      child: Row(children: [
                        Expanded(
                          //Start Date
                          child: FlatButton(
                            height: 28,
                            child: Text(
                              DateFormat.yMMMd().format(_selectedStartDate),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.color
                                    ?.withOpacity(1),
                                fontSize: 12,
                              ),
                            ),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(7)),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          //End Date
                          child: FlatButton(
                            height: 28,
                            child: Text(
                              DateFormat.yMMMd().format(_selectedEndDate),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.color
                                    ?.withOpacity(1),
                                fontSize: 12,
                              ),
                            ),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(7)),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        //Select Date Button
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.calendar_month_outlined,
                          ),
                          color: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.color
                              ?.withOpacity(0.75),
                          onPressed: _getDateFromUser,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                      ]),
                    ),
                    //Time
                    Row(
                      children: [
                        //Start Time
                        FlatButton(
                          minWidth: 112,
                          height: 28,
                          child: Text(
                            _showStartTime,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.color
                                  ?.withOpacity(1),
                              fontSize: 12,
                            ),
                          ),
                          onPressed: () {
                            _getTimeFromUser(isStartTime: true);
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        //End Time
                        FlatButton(
                          minWidth: 112,
                          height: 28,
                          child: Text(
                            _showEndTime,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.color
                                  ?.withOpacity(1),
                              fontSize: 12,
                            ),
                          ),
                          onPressed: () {
                            _getTimeFromUser(isStartTime: false);
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                        SizedBox(
                          width: 26,
                        ),
                        //Notifications Button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _click = !_click;
                            });
                          },
                          child: Icon(
                            (_click == false)
                                ? Icons.notifications
                                : Icons.notifications_on,
                            color: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.color
                                ?.withOpacity(0.75),
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    //Repeat
                    FlatButton(
                      child: NotiBar(
                          title: "REPEAT",
                          fill:
                              "                                        $_selectedRepeat",
                          widget: DropdownButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.color
                                  ?.withOpacity(.75),
                            ),
                            borderRadius: BorderRadius.circular(7),
                            elevation: 0,
                            isDense: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedRepeat = newValue!;
                              });
                            },
                            items: repeatList
                                .map<DropdownMenuItem<String>>((String? value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value!,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.color
                                        ?.withOpacity(.75),
                                  ),
                                ),
                              );
                            }).toList(),
                          )),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: kWhiteColor.withOpacity(1),
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      onPressed: () {},
                    ),
                    //Alert
                    FlatButton(
                      child: NotiBar(
                          title: "ALERT",
                          fill:
                              "                                 $_selectedAlert minutes",
                          widget: DropdownButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.color
                                  ?.withOpacity(.85),
                            ),
                            borderRadius: BorderRadius.circular(7),
                            elevation: 0,
                            isDense: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedAlert = int.parse(newValue!);
                              });
                            },
                            items: alertList
                                .map<DropdownMenuItem<String>>((int value) {
                              return DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(
                                  value.toString(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.color
                                        ?.withOpacity(1),
                                  ),
                                ),
                              );
                            }).toList(),
                          )),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: kWhiteColor.withOpacity(1),
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      onPressed: () {},
                    ),
                    //showAs
                    FlatButton(
                      child: NotiBar(
                          title: "SHOW AS",
                          fill:
                              "                              $_selectedShowAs",
                          widget: DropdownButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.color
                                  ?.withOpacity(1),
                            ),
                            borderRadius: BorderRadius.circular(7),
                            elevation: 0,
                            isDense: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedShowAs = newValue!;
                              });
                            },
                            items: showAsList
                                .map<DropdownMenuItem<String>>((String? value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value!,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.color
                                        ?.withOpacity(1),
                                  ),
                                ),
                              );
                            }).toList(),
                          )),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: kWhiteColor.withOpacity(1),
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    //Note
                    MyInputField(
                      title: "NOTES",
                      hint: "Notes",
                      controller: _noteController,
                    ),
                    SizedBox(height: 28.0),

                    //Add Label
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _colorPallete(),
                      ],
                    ),
                  ]),
            ),
            margin: EdgeInsets.only(
              left: 28,
              right: 28,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.color
                  ?.withOpacity(.54),
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(
              left: 28.0,
              top: 16.0,
              right: 28.0,
              bottom: 44.0,
            ),
            //Delete Button
            child: FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("DELETE THIS ACTIVITY",
                      style: TextStyle(fontSize: 14, color: Colors.red)),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              color: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.color
                  ?.withOpacity(.54),
              onPressed: () => Get.back(),
            ),
          ),
        ),
      ),
    );
  }

  _validateDate() {
    if (_titleController.text.isNotEmpty) {
      _addTaskToDb();
      _taskController.getTasks();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EventList()),
      );
    } else if (_titleController.text.isEmpty) {
      Get.snackbar("Required", "All fields are required !",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.pink,
          icon: Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ));
    }
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(
        task: Task(
      title: _titleController.text,
      startDate: DateFormat.MMMMEEEEd().format(dateRange.start),
      endDate: DateFormat.MMMMEEEEd().format(dateRange.end),
      startTime: _startTime,
      endTime: _endTime,
      repeat: _selectedRepeat,
      alert: _selectedAlert,
      showAs: _selectedShowAs,
      note: _noteController.text,
      color: _selectedColor,
      codeSee: _colorCode,
    ));
    print("My id is" + " $value");
  }

  _selectAllDay() {
    _startTime = "00:00 AM";
    _showStartTime = "";
    _endTime = "11:59 PM";
    _showEndTime = "";
  }

  Future _getDateFromUser() async {
    final themeData = Theme.of(context);
    DateTimeRange? _pickerDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(2015),
      lastDate: DateTime(2122),
      builder: (context, Widget? child) => Theme(
        data: themeData.copyWith(
          scaffoldBackgroundColor:
              Theme.of(context).textTheme.bodyText2?.color?.withOpacity(1),
          appBarTheme: themeData.appBarTheme.copyWith(
            backgroundColor: Color.fromARGB(179, 186, 210, 255),
          ),
          textTheme:
              GoogleFonts.federoTextTheme(Theme.of(context).textTheme).apply(
            bodyColor:
                Theme.of(context).textTheme.headline1?.color?.withOpacity(1),
          ),
          colorScheme: ColorScheme.light(
              onPrimary: kBlackColor,
              primary: kPrimaryColor,
              onSurface: kPrimaryColor),
        ),
        child: child!,
      ),
    );

    if (_pickerDateRange == null) return; //press X

    setState(() => dateRange = _pickerDateRange); //press save
    print(dateRange);
  }

  Future _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time canceld");
    } else if (isStartTime == true) {
      _startTime = _formatedTime;
      _showStartTime = _startTime;
      print(dateRange);
    } else if (isStartTime == false) {
      _endTime = _formatedTime;
      _showEndTime = _endTime;
      print(dateRange);
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        //_startTime --> 10:30 AM
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }

  _colorPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add Label",
          style: TextStyle(
              color:
                  Theme.of(context).textTheme.headline1?.color?.withOpacity(1),
              fontSize: 12),
        ),
        SizedBox(
          height: 8.0,
        ),
        Wrap(
          children: List<Widget>.generate(5, (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                  if (index == 0) {
                    pickColor(context);
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7.0),
                  child: Container(
                    height: 25.0,
                    width: 25.0,
                    color: index == 0
                        ? chooseColor
                        : index == 1
                            ? kPicker1
                            : index == 2
                                ? kPicker2
                                : index == 3
                                    ? kPicker3
                                    : kPicker4,
                    child: _selectedColor == index
                        ? Icon(Icons.colorize_rounded,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.color
                                ?.withOpacity(1),
                            size: 20)
                        : Container(),
                  ),
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  Widget buildColorPicker() => ColorPicker(
        // ignore: deprecated_member_use
        showLabel: false,
        pickerColor: chooseColor,
        onColorChanged: (color) => setState(
          () => this.chooseColor = color,
        ),
      );

  void pickColor(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              "Pick Your Color",
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.color
                    ?.withOpacity(1),
              ),
            ),
            backgroundColor: Theme.of(context).iconTheme.color?.withOpacity(1),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildColorPicker(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      onPressed: () => Get.back(),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      child: Text(
                        "Select",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () {
                        print(chooseColor.hashCode);
                        _colorCode = chooseColor.hashCode;
                        return Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ));
}
