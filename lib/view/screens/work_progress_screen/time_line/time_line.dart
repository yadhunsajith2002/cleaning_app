import 'package:cleaning_app/view/screens/work_progress_screen/detaisl_card/details_card.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLine extends StatelessWidget {
  const MyTimeLine({
    super.key,
    required this.isFirt,
    required this.isLast,
    required this.isPast,
    required this.progressCard,
  });

  final bool isFirt;
  final bool isLast;
  final bool isPast;
  final Widget progressCard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TimelineTile(
        isFirst: isFirt,
        isLast: isLast,
        beforeLineStyle:
            LineStyle(color: isPast ? Colors.green : Colors.grey.shade400),
        indicatorStyle: IndicatorStyle(
          color: isPast ? Colors.green : Colors.grey.shade400,
          width: 25,
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: isPast ? Colors.white : Colors.grey.shade400,
            fontSize: 18,
          ),
        ),
        endChild: ProgressCard(isPassed: isPast, child: progressCard),
      ),
    );
  }
}
