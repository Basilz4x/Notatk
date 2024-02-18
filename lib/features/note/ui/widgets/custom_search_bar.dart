import 'package:flutter/material.dart';
import 'package:note_app/utils/constant/color_constant.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.done,
        maxLines: 2,
        minLines: 2,
        cursorColor: AppColor.textColor.withOpacity(0.7),
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: AppColor.textColor,
            ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search for notes",
          hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppColor.textColor.withOpacity(0.7),
              ),
        ),
      ),
    );
  }
}
