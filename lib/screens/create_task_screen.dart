import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/routes/routes.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context,GoRouterState state)=>const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState()=>_CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen>{
  final TextEditingController _titleController=TextEditingController();
  final TextEditingController _noteController=TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: 'Add new task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(title: 'Task title',hintText:'Task title',controller:_titleController ,),
              const Gap(16),
              const SelectCategory(),
              const Gap(16),
              const SelectDateTime(),
              const Gap(16),
              CommonTextField(title: 'Task note',hintText:'Task note',maxLine: 6,controller: _noteController,),
              const Gap(16),
              ElevatedButton(
                onPressed: _createTask, 
                child: const DisplayWhiteText(text: 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title=_titleController.text.trim();
    final note=_noteController.text.trim();
    final date=ref.watch(dateProvider);
    final time=ref.watch(timeProvider);
    final category=ref.watch(categoryProvider);
    if(title.isNotEmpty){
      final task=Task(
        title: title, 
        note: note,
        time: Helpers.timeToString(time), 
        date: DateFormat.yMMMd().format(date), 
        taskCategory: category, 
        isCompleted: false
      );

      await ref.read(taskProvider.notifier).createTask(task).then((value){
        context.go(RouteLocation.home);
      });
    }
  }
}
  
