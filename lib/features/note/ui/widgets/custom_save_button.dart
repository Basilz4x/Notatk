import 'package:flutter/material.dart';
import 'package:note_app/utils/constant/color_constant.dart';

class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          alignment: Alignment.center,
          height: 55,
          width: 100,
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(18)),
          child: Text("Save",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColor.textColor,
                  ))),
    );
  }
}
