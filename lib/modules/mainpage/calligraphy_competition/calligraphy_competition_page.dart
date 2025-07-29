import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:moyunzhijiao/modules/mainpage/calligraphy_competition/calligraphy_competition_controller.dart';

class CalligraphyCompetitionPage
    extends GetView<CalligraphyCompetitionController> {
  const CalligraphyCompetitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      color: Colors.orange[100],
      alignment: Alignment.center,
      child: const Text(
        '下部区域',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
