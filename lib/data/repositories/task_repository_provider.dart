import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/data/repositories/repositories.dart';
import 'package:todo_app/data/repositories/task_repositories.dart';

final TaskRepositoryProvider = Provider<TaskRepositories>((ref) {
  final dataSource=ref.watch(taskDataSourceProvider);
  return TaskRepositoriesImpl(dataSource);
});