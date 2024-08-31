import 'package:assignment/constants/google_icons.dart';
import 'package:assignment/ui/dashboard/usage_piechart.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

//UI for the dashboard page with charts
class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: Colors.black,
        width: 2,
        child: Row(
          children: [
            SizedBox(
              width: 320,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF161639),
                      Color.fromARGB(255, 36, 36, 108)
                    ],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WindowTitleBarBox(child: MoveWindow()),
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/1 1.png',
                            fit: BoxFit.contain,
                            height: 120,
                            width: 200,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 50),
                                padding: const EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    GoogleIcons.analytics,
                                    color: Color(0xFF161639),
                                    size: 30,
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'Analytics',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF161639),
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  GoogleIcons.feedback,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  'Feedback',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //widget to show the pie charts for ram and cpu usage
            const UsagePieChart()
          ],
        ),
      ),
    );
  }
}
