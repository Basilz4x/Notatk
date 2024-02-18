import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/note/ui/controllers/home_page_controller.dart';
import 'package:note_app/utils/constant/color_constant.dart';

class CustomRefreshButton extends ConsumerWidget {
  const CustomRefreshButton({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        ref.invalidate(homePageControllerProvider);
      },
      child: Container(
          alignment: Alignment.center,
          height: 55,
          width: 230,
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(18)),
          child: Text("Try again",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColor.textColor,
                  ))),
    );
  }
}
