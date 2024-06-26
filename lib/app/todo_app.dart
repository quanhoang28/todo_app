import 'package:flutter/material.dart';
import 'package:todo_app/config/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/routes/routes.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final routerConfig=ref.watch(routesProvider);
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: routerConfig,
    );
  }
}