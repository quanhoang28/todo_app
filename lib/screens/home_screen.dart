import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/data/data.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final colors=context.colorScheme;
    final deviceSize=context.deviecSize;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height*0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      DisplayWhiteText(text: 'Aug 7, 2023',fontSize: 20,),
                      DisplayWhiteText(text: 'My Todo list',fontSize: 40,),
                      
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DisplayTasksList(
                    tasks: [
                      Task(title: 'title1', note: 'note', time: '10:14', date: 'Aug, 07', taskCategory: TaskCategory.education,isCompleted: false),
                      Task(title: 'title2', note: 'note2', time: '10:16', date: 'Aug, 07', taskCategory: TaskCategory.health,isCompleted: false),
                      Task(title: 'title3', note: 'note', time: '10:14', date: 'Aug, 07', taskCategory: TaskCategory.work,isCompleted: false),
                      Task(title: 'title4', note: 'note2', time: '10:16', date: 'Aug, 07', taskCategory: TaskCategory.social,isCompleted: false)
                    ], 
                  ),
                  const Gap(20),
                  Text('Completed',style: context.textTheme.headlineMedium,),
                  const Gap(20),
                  const DisplayTasksList(
                    tasks: [
                      Task(title: 'title3', note: 'note', time: '10:14', date: 'Aug, 07', taskCategory: TaskCategory.education,isCompleted: true),
                      Task(title: 'title4', note: 'note2', time: '10:16', date: 'Aug, 07', taskCategory: TaskCategory.health,isCompleted: true)
                    ], 
                    isCompletedTasks: true,
                  ),
                  const Gap(20),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: DisplayWhiteText(text: 'Add new task')
                      ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}