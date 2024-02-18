import 'package:flutter/material.dart';
import 'package:note_app/utils/constant/color_constant.dart';

class NoSearchResultDesign extends StatelessWidget {
  const NoSearchResultDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(18)),
      height: 100,
      child: Center(
        child: Text(
          "An error occurred. try to search again",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColor.textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
