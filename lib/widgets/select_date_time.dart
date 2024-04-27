// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final date=ref.watch(dateProvider);
    final time=ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            title: 'Date',
            hintText:DateFormat.yMMMd().format(date),
            suffixIcon: IconButton(
              onPressed: ()=>_selectDate(context,ref), 
              icon: const Icon(Icons.calendar_month_rounded)
            ),
            readOnly: true,
          ),
        ),
        const Gap(16),
        Expanded(
          child: CommonTextField(
            readOnly: true,
            title: 'Time',
            hintText:Helpers.timeToString(time),
            suffixIcon: IconButton(
              onPressed: ()=>_selectTime(context,ref), 
              icon: const Icon(Icons.access_time)
            ),
          ),
        ),
      ],
    );
  }

  void _selectDate(BuildContext context,WidgetRef ref) async{
    final initialDate=ref.read(dateProvider);
    DateTime?pickedDate=await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2023), 
      lastDate: DateTime(2090),
    );
    if(pickedDate!=null){
      ref.read(dateProvider.notifier).state=pickedDate;
    }
  }
  void _selectTime(BuildContext context,WidgetRef ref) async{
    TimeOfDay?pickedTime=await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now(),
    );

    if(pickedTime!=null){
      ref.read(timeProvider.notifier).state=pickedTime;
    }
  }
}