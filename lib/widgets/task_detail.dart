import 'package:flutter/material.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/widgets.dart';
import 'package:gap/gap.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    final style=context.textTheme;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Center(
            child: CircleContainer(
              color: task.taskCategory.color.withOpacity(0.3),
              child: Icon(
                task.taskCategory.icon,
                color: task.taskCategory.color.withOpacity(0.5),
              ),
            ),
          ),
          Text(
            task.title,
            style: style.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
          Text(
            task.time,
          ),
          const Gap(10),
          Visibility(
            visible: !task.isCompleted,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text('Task to be completed on ${task.date}',),
                 Icon(Icons.check_box_rounded,color:task.taskCategory.color,)
              ],
            )
          ),
          Divider(
            color: task.taskCategory.color,
            thickness: 1.5,
          ),
          Text(
            task.note.isEmpty?'There is no additional note for this task!':task.note
          ),
           Visibility(
            visible: task.isCompleted,
            child:const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text('Task is completed!',),
                 Icon(Icons.check_box_rounded,color:Colors.green,)
              ],
            )
          ),
        ],
      ),
    );
  }
}