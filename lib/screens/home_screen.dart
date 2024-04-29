import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/config/config.dart';
import 'package:todo_app/data/data.dart';
import '../providers/providers.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context,GoRouterState state)=>const HomeScreen();
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final colors=context.colorScheme;
    final deviceSize=context.deviecSize;
    final taskState=ref.watch(taskProvider);

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
                  DisplayTasksList(
                    tasks: taskState.tasks,
                  ),
                  const Gap(20),
                  Text('Completed',style: context.textTheme.headlineMedium,),
                  const Gap(20),
                  DisplayTasksList(
                    tasks: taskState.tasks,
                  ),
                  const Gap(20),
                  ElevatedButton(
                    onPressed: ()=>context.push(RouteLocation.createTask),
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