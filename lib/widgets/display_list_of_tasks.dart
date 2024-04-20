import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/utils.dart';
import '../data/data.dart';
import 'widgets.dart';


class DisplayTasksList extends StatelessWidget {
  const DisplayTasksList({super.key, required this.tasks,this.isCompletedTasks=false});

  final List<Task> tasks;
  final bool isCompletedTasks;
  
  @override
  Widget build(BuildContext context) {
    final deviecSize=context.deviecSize;
    final height=isCompletedTasks?deviecSize.height*0.25:deviecSize.height*0.3;
    final emptyTaskMessage=isCompletedTasks?
      'There is no completed task yet':
      'There is no task todo!';

    return CommonContainer(
      height: height,
      child:tasks.isEmpty?
        Center(
          child: Text(
            emptyTaskMessage,
            style: context.textTheme.headlineSmall,
          ),
        ):
      ListView.separated(
      padding:  EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task=tasks[index];
        return InkWell(
          onLongPress: () {
            
          },
          onTap: () async {
            await showModalBottomSheet(context: context, builder: (ctx){
              return TaskDetail(task:task);
            });
          },
          child: TaskTitle(task: task)
        );
      }, 
      separatorBuilder: (BuildContext context, int index) { 
        return const Divider(thickness: 1.5,);
      },),
    );
  }
}