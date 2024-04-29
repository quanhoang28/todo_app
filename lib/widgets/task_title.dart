import 'package:flutter/material.dart';
import 'package:todo_app/data/data.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/widgets.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final styles=context.textTheme;
    final textDecoration=task.isCompleted?TextDecoration.lineThrough:null;
    final fontWeight=task.isCompleted?FontWeight.normal:FontWeight.bold;
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleContainer(
              color: task.taskCategory.color.withOpacity(0.3),
              child: Icon(
                  task.taskCategory.icon,
                  color: task.taskCategory.color.withOpacity(0.5),
                ),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: styles.titleMedium?.copyWith(
                        decoration: textDecoration,
                        fontSize: 20,
                        fontWeight: fontWeight,
                      ),
                    ),
                    Text(
                      task.time,
                      style: styles.titleMedium?.copyWith(
                        decoration: textDecoration,
                        fontSize: 20,
                        fontWeight: fontWeight,
                      ),
                    ),
                  ],
                ),
              ),
              Checkbox(
                value: task.isCompleted, 
                onChanged: (value){}
              ),
            ],
          ),
        );
  }
}