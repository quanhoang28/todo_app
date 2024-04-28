import 'package:flutter/material.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/utils/task_category.dart';
import 'package:todo_app/widgets/circle_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final taskCategories=TaskCategory.values.toList();
    final selectedCategory=ref.watch(categoryProvider);
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            'Category',
            style: context.textTheme.titleLarge,
          ),
          const Gap(16),
          Expanded(
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx,index){
                final category=taskCategories[index];
                return InkWell(
                  onTap: (){
                    ref.read(categoryProvider.notifier).state=category;
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: CircleContainer(
                    color: category.color.withOpacity(0.3),
                    child: Icon(
                      category.icon,
                      color: selectedCategory == category?category.color.withOpacity(1):category.color.withOpacity(0.2),
                    ),
                  ),
                );
              }, 
              separatorBuilder: (ctx,index)=>const Gap(8), 
              itemCount: taskCategories.length
            )
          )
        ],
      ),
    );
  }
}