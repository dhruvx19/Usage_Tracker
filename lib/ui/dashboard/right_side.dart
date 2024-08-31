import 'package:assignment/widgets/circle_chart.dart';
import 'package:assignment/providers/websocket_provider.dart';
import 'package:assignment/widgets/window_button.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'package:google_fonts/google_fonts.dart';

class RightSide extends StatefulWidget {
  const RightSide({super.key});

  @override
  State<RightSide> createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  final Logger _logger = Logger('RightSide');

  @override
  void initState() {
    super.initState();
    _logger.info('RightSide widget initialized');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(child: MoveWindow()),
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0, right: 8),
                    child: WindowButtons(),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Analytics',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF161639),
                      fontSize: 32,
                    ),
                  ),
                  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Hello',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'User',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF161639),
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Image.asset(
                          'assets/images/user_image.png',
                          fit: BoxFit.contain,
                          height: 80,
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 120),
            Consumer<WebSocketProvider>(builder: (context, usageProvider, child) {
              final usageModel = usageProvider.usageModel;
              if (usageModel == null) {
                _logger.warning(
                    'UsageModel is null, displaying CircularProgressIndicator');
                return const CircularProgressIndicator();
              } else {
                _logger.info('Displaying CPU and RAM usage');
                return LayoutBuilder(
                  builder: (context, constraints) {
                    double spacing = constraints.maxWidth < 600 ? 30 : 120;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedCircularProgressIndicator(
                          percentage: usageModel.cpuUsage / 100,
                          text: "CPU",
                        ),
                        SizedBox(width: spacing),
                        RoundedCircularProgressIndicator(
                          percentage: usageModel.ramUsage / 100,
                          text: "RAM",
                        ),
                      ],
                    );
                  },
                );
              }
            }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
