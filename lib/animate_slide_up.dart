import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class AnimateSideUp extends StatefulWidget {
  const AnimateSideUp({Key? key}) : super(key: key);

  @override
  State<AnimateSideUp> createState() => _AnimateSideUpState();
}

class _AnimateSideUpState extends State<AnimateSideUp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _position;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000),
    );
    _position = Tween<double>(begin: 20, end: 30).animate(CurvedAnimation(parent: _controller, curve: Interval(0,1))
    )..addListener(() {
      setState(() {});
    });
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: _position.value),
          child: Icon(
            CommunityMaterialIcons.login,
            color: Theme.of(context).iconTheme.color?.withOpacity(0.75),
            size: 36,
          ),
        ),
      ],
    );
  }
}
