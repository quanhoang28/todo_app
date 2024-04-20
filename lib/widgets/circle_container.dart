import 'package:flutter/material.dart';
import '../data/data.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    final double iconOpacity=task.isCompleted?0.3:0.5;
    final backGroundOpacity=task.isCompleted?0.1:0.3;
    return Container(
    padding:  const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: task.taskCategory.color.withOpacity(backGroundOpacity),
        border: Border.all(
          width: 2,
          color: task.taskCategory.color,
        )
      ),
      child: Center(
        child: Icon(
          task.taskCategory.icon,
          color: task.taskCategory.color.withOpacity(iconOpacity),

        ),
      ),
    );
  }
}