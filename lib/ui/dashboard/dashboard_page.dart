import 'package:assignment/ui/dashboard/left_side.dart';
import 'package:assignment/ui/dashboard/right_side.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}
const borderColor = Color(0xFF805306);

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: borderColor,
        width: 1,
        child: const Row(
          children: [LeftSide(), RightSide()],
        ),
      ),
    );
  }
}
