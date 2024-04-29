// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/data/repositories/task_repositories.dart';
import 'package:todo_app/providers/providers.dart';

class TaskNotifier extends StateNotifier<TaskState>{
  final TaskRepositories _repositories;
  TaskNotifier(this._repositories):super(const TaskState.initial()){
    getAllTask();
  }

  Future<void> createTask(Task task)async{
    try{
      await _repositories.createTask(task);
      getAllTask();
    }catch(e){
      debugPrint(e.toString());
    }
  }

  Future<void> deleteTask(Task task)async{
    try{
      await _repositories.deleteTask(task);
      getAllTask();
    }catch(e){
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(Task task)async{
    try{
      final isCompleted=!task.isCompleted;
      final updatedTask=task.copyWith(isCompleted:isCompleted );
      await _repositories.updateTask(updatedTask);
      getAllTask();
    }catch(e){
      debugPrint(e.toString());
    }
  }

 void getAllTask()async{
    try{
      final tasks= await _repositories.getAllTasks();
      state=state.copyWith(tasks: tasks);
    }catch(e){
      debugPrint(e.toString());
    }
  }
}