import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(BuildContext context,GoRouterState state)=>const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: 'Add new task'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CommonTextField(title: 'Task title',hintText:'Task title',),
            const Gap(16),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(title: 'Date',hintText:'Aug, 07',suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.calendar_month_rounded)),),
                ),
                const Gap(16),
                Expanded(
                  child: CommonTextField(title: 'Time',hintText:'10:30', suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.access_time)),),
                ),
              ],
            ),
            const Gap(16),
            const CommonTextField(title: 'Task note',hintText:'Task note',maxLine: 6,),
            const Gap(16),
            ElevatedButton(
              onPressed: (){}, 
              child: const DisplayWhiteText(text: 'Save'),
            ),
          ],
        ),
      ),
    );
  }
}