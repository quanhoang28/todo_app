import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/data.dart';

final taskDataSourceProvider = Provider<TaskDataSource>((ref) {
  return TaskDataSource();
});