import 'package:flutter/material.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:gap/gap.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({super.key, required this.title, required this.hintText, this.maxLine, this.suffixIcon,this.readOnly=false});
  final String title;
  final String hintText;
  final int? maxLine;
  final Widget? suffixIcon;
  final bool readOnly;
  // final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        const Gap(10),
        TextField(
          // controller: controller,
          readOnly: readOnly,
          maxLines: maxLine,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          onTapOutside: (event){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: (value){},
        )
      ],
    );
  }
}