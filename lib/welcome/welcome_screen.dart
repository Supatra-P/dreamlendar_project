// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dreamlendar/aMonth/a_month_screen.dart';
import 'package:dreamlendar/constants.dart';
import 'package:dreamlendar/services/theme_sevices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool click = true;

  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // final imageTemporary = File(image.path);
      // setState(() => this.image = imageTemporary);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background
        decoration: BoxDecoration(
          image: image != null
              ? DecorationImage(
                  image: FileImage(image!),
                  fit: BoxFit.cover,
                )
              : DecorationImage(
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
                      child: buildButton(
                        icons: Icon(
                          Icons.crop_original_rounded,
                          color: Theme.of(context)
                              .iconTheme
                              .color
                              ?.withOpacity(0.75),
                        ),
                        onClicked: () => pickImage(ImageSource.gallery),
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
              // click to open calendar button
              Container(
                // height: 40,
                // width: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(75, 255, 255, 255),
                        Color.fromARGB(11, 255, 255, 255)
                      ],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight),
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: EdgeInsets.all(12),
                child: IconButton(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.login_rounded,
                    color: Theme.of(context).iconTheme.color?.withOpacity(.85),
                    size: 36,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => A_MonthsScreen()),
                  ),
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
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeScreen(),
                          ),
                        ),
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

  Widget buildButton({
    required Icon icons,
    required VoidCallback onClicked,
  }) =>
      IconButton(
        onPressed: onClicked,
        icon: icons,
      );
}
